import Foundation
import SwiftUI

public struct IconView: View {

  private let iconColor: Color
  private let iconSize: CGSize?
  private let iconPadding: EdgeInsets?
  private let icon: Image

  public var body: some View {
    ZStack {
      Circle()
        .fill(.red.opacity(0.01))
        .frame(width: iconSize?.width, height: iconSize?.height)

      icon
        .applyIf(iconSize != nil) {
          $0
            .resizable()
            .frame(width: iconSize?.width, height: iconSize?.height)
        }
        .foregroundColor(iconColor)
        .applyIf(iconPadding != nil) {
          $0.padding(iconPadding ?? .zero)
        }
    }
  }


  public init(
    icon: Image,
    iconColor: Color = .primary,
    iconSize: CGSize? = CGSize(width: 20, height: 20),
    iconPadding: EdgeInsets? = nil
  ) {
    self.icon = icon
    self.iconColor = iconColor
    self.iconSize = iconSize
    self.iconPadding = iconPadding
  }
}

extension IconView: Equatable {
    public static func == (lhs: IconView, rhs: IconView) -> Bool {
        lhs.icon == rhs.icon
    }
}

struct RoundedIcon_Previews: PreviewProvider {
    static var previews: some View {
      IconView(icon: Image(uiImage: .add))
        .previewLayout(.sizeThatFits)
        .padding(20)
    }
}
