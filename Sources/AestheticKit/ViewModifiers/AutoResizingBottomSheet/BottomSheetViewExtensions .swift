import SwiftUI

public extension View {
  @ViewBuilder func bottomSheet<Content>(
    isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    backgroundColor: Color? = .primary,
    @ViewBuilder content: @escaping () -> Content
  ) -> some View where Content: View {
    sheet(isPresented: isPresented) {
      LazyView(
        AutoResizingBottomSheet(content: content, onDismiss: onDismiss, backgroundColor: backgroundColor)
      )
    }
  }
}
