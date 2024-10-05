import UIKit

public class ThemeConfigurationUserDefaults {}

extension ThemeConfigurationUserDefaults: ThemeConfigurationUserDefaultsProtocol {
  public func getAppTheme() -> String {
    UserDefaults.standard.string(forKey: GlobalConstants.Strings.appTheme) ?? ""
   }

  public func setAppTheme(_ theme: Theme) {
    UserDefaults.standard.set(theme.rawValue, forKey: GlobalConstants.Strings.appTheme)
  }
}
