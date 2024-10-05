import UIKit

public struct AppThemeColorPack {
  public let primaryColor: UIColor
  public let secondaryColor: UIColor
  public let textPrimary: UIColor
  public let textSecondary: UIColor
  public let backgroundPrimary: UIColor

  public init(
    primaryColor: UIColor,
    secondaryColor: UIColor,
    textPrimary: UIColor,
    textSecondary: UIColor,
    backgroundPrimary: UIColor
  ) {
    self.primaryColor = primaryColor
    self.secondaryColor = secondaryColor
    self.textPrimary = textPrimary
    self.textSecondary = textSecondary
    self.backgroundPrimary = backgroundPrimary
  }
}
