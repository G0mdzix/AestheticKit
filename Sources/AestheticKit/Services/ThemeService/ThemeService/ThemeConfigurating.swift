import SwiftUI

protocol ThemeConfigurating {
  func configureAppearance()
  func configureTheme(for window: UIWindow?)
  func setupAppThemeColorPack(_ pack: AppThemeColorPack)

  var onColorSchemeChanged: (() -> Void)? { get }
}
