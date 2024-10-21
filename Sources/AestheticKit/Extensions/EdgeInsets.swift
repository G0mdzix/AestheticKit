import SwiftUI

public extension EdgeInsets {
  static let zero = EdgeInsets()
  static let horizontal = EdgeInsets(top: 0, leading: DefaultSpacings.large, bottom: 0, trailing: DefaultSpacings.large)
  static let vertical = EdgeInsets(top: DefaultSpacings.large, leading: 0, bottom: DefaultSpacings.large, trailing: 0)
  static let halfHorizontal = EdgeInsets(
    top: 0,
    leading: DefaultSpacings.large,
    bottom: 0,
    trailing: DefaultSpacings.large
  )
    static let halfVertical = EdgeInsets(
      top: DefaultSpacings.large,
      leading: 0,
      bottom: DefaultSpacings.large,
      trailing: 0
    )

    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}
