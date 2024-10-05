import SwiftUI

public struct AutoResizingBottomSheet<Content>: View where Content: View {

  @State private var height: CGFloat = .zero

  private let content: () -> Content
  private let backgroundColor: Color
  private var onDismiss: (() -> Void)?

  private static var maxHeight: CGFloat {
    UIScreen.main.bounds.size.height
  }

  private static var cornerRadius: CGFloat {
    64
  }

  init(
    @ViewBuilder content: @escaping () -> Content,
    onDismiss: (() -> Void)? = nil,
    backgroundColor: Color? = .primary
  ) {
    self.content = content
    self.onDismiss = onDismiss
    self.backgroundColor = backgroundColor ?? .primary
  }

  public var body: some View {
    if #available(iOS 16.4, *) {
      contentBody
        .background(backgroundColor)
        .presentationCornerRadius(AutoResizingBottomSheet<Content>.cornerRadius)
        .presentationContentInteraction(.scrolls)
        .presentationBackground(backgroundColor)
    } else {
      contentBody
        .background(backgroundColor)
    }
  }

  private var contentBody: some View {
    VStack(spacing: 0) {
      if height >= AutoResizingBottomSheet<Content>.maxHeight {
        ScrollView {
          mainBody
        }
      } else {
        mainBody
      }
    }
  }

  private var mainBody: some View {
    ZStack {
      content()
        .geometryReader {
          height = min(AutoResizingBottomSheet<Content>.maxHeight, $0.height)
        }
        .applyIf(UIDevice.current.userInterfaceIdiom == .pad) { content in
          content.frame(width: 375)
        }
        .background(backgroundColor)
        .onDisappear(perform: onDismiss)
        .presentationDetents(height == .zero ? [.medium] : [.height(height)])
        .presentationDragIndicator(.visible)
    }
  }
}
