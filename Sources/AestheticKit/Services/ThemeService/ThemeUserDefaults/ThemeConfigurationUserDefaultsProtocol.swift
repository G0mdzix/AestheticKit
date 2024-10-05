import UIKit

public protocol ThemeConfigurationUserDefaultsProtocol {
  func getAppTheme() -> String
  func setAppTheme(_ theme: Theme)
}
