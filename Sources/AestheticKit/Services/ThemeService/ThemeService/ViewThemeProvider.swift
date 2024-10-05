import UIKit

final class ViewThemeProvider {

  private let view: UIView

  var displayTheme: Theme {
    Theme.current == .auto ? systemTheme : .current
  }

  private var systemTheme: Theme {
    switch view.traitCollection.userInterfaceStyle {
    case .light:
      .light
    case .dark:
      .dark
    default:
      .auto
    }
  }

  init(view: UIView) {
    self.view = view
  }
}
