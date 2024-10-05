import SwiftUI

public class ThemeConfigurator: ThemeConfigurating {

  @Injected(\.themeConfigurationUserDefaultsProvider)
  private var themeUserDefaults: ThemeConfigurationUserDefaultsProtocol
  @Injected(\.colorConfigurationUserDefaultsProvider)
  private var colorUserDefaults: ColorsSetConfigurationUserDefaultsProtocol

  public var onColorSchemeChanged: (() -> Void)?

  private var window: UIWindow?
  private var themePack: AppThemeColorPack?

  private var displayTheme: Theme? {
    guard let window else { return nil }
    return ViewThemeProvider(view: window).displayTheme
  }

  private var selectedColorIndex: Int {
    colorUserDefaults.getAppColors()
  }

  public init() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(appThemeChanged),
      name: .appThemeChanged,
      object: nil
    )
  }

  // MARK: - Appearance

  public func setupAppThemeColorPack(_ pack: AppThemeColorPack) {
    themePack = pack
  }

  public func configureAppearance() {
    UINavigationBar.appearance().configureDefaultStyle(
      backgroundColor: themePack?.backgroundPrimary,
      textColor: themePack?.textPrimary,
      disabledTextColor: themePack?.textSecondary
    )

    let appearance = UITabBarAppearance()
    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance

    UITextView.appearance().configureDefaultStyle()
    UITableView.appearance().configureDefaultStyle()
    UIScrollView.appearance().keyboardDismissMode = .onDrag

    UIPageControl.appearance().currentPageIndicatorTintColor = themePack?.backgroundPrimary
    UIPageControl.appearance().pageIndicatorTintColor = themePack?.primaryColor
    UIPageControl.appearance().tintColor = themePack?.secondaryColor
  }

  // MARK: - Theme

  public func configureTheme(for window: UIWindow?) {
    self.window = window

    setThemeFromSettings()
  }

  @objc
  private func appThemeChanged(_ notification: Notification) {
    Task { @MainActor in
      
      onColorSchemeChanged?()
      themeUserDefaults.setAppTheme(Theme.current)

      configureAppearance()
      rebuildViews()
    }
  }

  private func rebuildViews() {
    guard let window else { return }

    for subview in window.subviews {
      subview.removeFromSuperview()
      window.addSubview(subview)
    }
  }

  private func setThemeFromSettings() {
    Task { @MainActor in
      switch themeUserDefaults.getAppTheme() {
      case Theme.light.rawValue:
        Theme.current = .light
        window?.overrideUserInterfaceStyle = .light
      case Theme.dark.rawValue:
        Theme.current = .dark
        window?.overrideUserInterfaceStyle = .dark
      default:
        window?.overrideUserInterfaceStyle = .unspecified
      }
    }
  }
}
