import SwiftUI

public struct MoreButton: View {

  @State private var shouldButtonExpand = false
  @State private var shouldIconHide = false
  @State private var items: [MoreButtonItems]

  private let backgroundColor: Color
  private let iconTintColor: Color
  private let strokeColor: Color
  private let lineWidth: CGFloat

  public var body: some View {
    ZStack {
      Color.primary.opacity(0.01)
        .ignoresSafeArea()
        .onTapGesture {
          guard shouldButtonExpand else { return }
          animationHandler()
        }

      capsuleBackground

      VStack(spacing: .zero) {
        mainIcon

        if shouldButtonExpand {
          itemsStack
        }
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
  }

  private var itemsStack: some View {
    ForEach($items, id: \.id) { $item in
      Button(
        action: {
          item.action()
          item.isPressed.toggle()
        },
        label: {
          if shouldIconHide {
            getSFSymbolIcon(name: item.isPressed ? item.secondarySFSymbolName : item.primarySFSymbolName)
              .padding(.vertical, Constants.verticalPadding)
          }
        }
      )
    }
  }

  private var capsuleBackground: some View {
    Capsule()
      .fill(backgroundColor, strokeBorder: strokeColor, lineWidth: lineWidth)
      .frame(
        width: Constants.circleSize,
        height: shouldButtonExpand ? (CGFloat(items.count + 1) * Constants.expandedHeight) : Constants.circleSize
      )
  }

  private var mainIcon: some View {
    ZStack {
      if shouldButtonExpand {
        getSFSymbolIcon(name: .xmark)
      } else {
        getSFSymbolIcon(name: .ellipsis)
      }
    }
    .padding(.vertical, Constants.verticalPadding)
    .onTapGesture { animationHandler() }
  }

  private func getSFSymbolIcon(name: SFSymbols) -> some View {
    Image(systemName: name.rawValue)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: Constants.itemSymbolSize, height: Constants.itemSymbolSize)
      .foregroundColor(iconTintColor)
  }

  private func animationHandler() {
    withAnimation(.bouncy(duration: Constants.animationDuration - Constants.offsetBetweenAnimations)) {
      shouldIconHide.toggle()
    }
    withAnimation(.bouncy(duration: Constants.animationDuration)) {
      shouldButtonExpand.toggle()
    }
  }

  public init(
    items: [MoreButtonItems],
    backgroundColor: Color,
    iconTintColor: Color,
    strokeColor: Color,
    lineWidth: CGFloat? = 3
  ) {
    self.items = items
    self.backgroundColor = backgroundColor
    self.iconTintColor = iconTintColor
    self.strokeColor = strokeColor
    self.lineWidth = lineWidth ?? 3
  }
}

#Preview {
  MoreButton(
    items: [MoreButtonItems(
      primarySFSymbolName: .dashboard,
      secondarySFSymbolName: .ellipsis,
      action: {}
    )],
    backgroundColor: .red,
    iconTintColor: .white,
    strokeColor: .blue
  )
}

private enum Constants {
  static let itemSymbolSize: CGFloat = 30
  static let verticalPadding: CGFloat = 12
  static let animationDuration: Double = 0.55
  static let circleSize: CGFloat = 50
  static let expandedHeight: CGFloat = 60
  static let offsetBetweenAnimations: CGFloat = 0.05
}
