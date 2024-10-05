import UIKit

public class ColorsSetConfigurationUserDefaults {}

extension ColorsSetConfigurationUserDefaults: ColorsSetConfigurationUserDefaultsProtocol {
  public func getAppColors() -> Int {
    UserDefaults.standard.integer(forKey: GlobalConstants.Strings.colorsSet)
   }

  public func setAppColors(_ color: AppColors) {
    UserDefaults.standard.set(color.rawValue, forKey: GlobalConstants.Strings.colorsSet)
  }
}
