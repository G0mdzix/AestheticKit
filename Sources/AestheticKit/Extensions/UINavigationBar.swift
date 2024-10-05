import UIKit

public extension UINavigationBar {

  func configureDefaultStyle(
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    largeTitleFont: UIFont = .boldSystemFont(ofSize: 16),
    titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium),
    buttonFont: UIFont = .systemFont(ofSize: 14, weight: .medium)
  ) {
    configureDefaultStandardStyle(
      backgroundColor: backgroundColor,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont,
      buttonFont: buttonFont
    )
    configureDefaultCompactStyle(
      backgroundColor: backgroundColor,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont,
      buttonFont: buttonFont
    )
    configureDefaultScrollEdgeAppearance(
      backgroundColor: backgroundColor,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont,
      buttonFont: buttonFont
    )
    tintColor = textColor
  }

  func configureDefaultCompactStyle(
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    largeTitleFont: UIFont = .boldSystemFont(ofSize: 24),
    titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium),
    buttonFont font: UIFont = .systemFont(ofSize: 14, weight: .medium)
  ) {
    let appearance = navigationBarAppearance(
      backgroundColor: backgroundColor,
      textColor: textColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont
    )
    appearance.buttonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.backButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.doneButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    compactAppearance = appearance
  }

  func configureDefaultStandardStyle(
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    largeTitleFont: UIFont = .boldSystemFont(ofSize: 24),
    titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium),
    buttonFont font: UIFont = .systemFont(ofSize: 14, weight: .medium)
  ) {
    let appearance = navigationBarAppearance(
      backgroundColor: backgroundColor,
      textColor: textColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont
    )
    appearance.buttonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.backButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.doneButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    standardAppearance = appearance
  }

  func configureDefaultScrollEdgeAppearance(
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    largeTitleFont: UIFont = .boldSystemFont(ofSize: 24),
    titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium),
    buttonFont font: UIFont = .systemFont(ofSize: 14, weight: .medium)
  ) {
    let appearance = navigationBarAppearance(
      backgroundColor: backgroundColor,
      textColor: textColor,
      largeTitleFont: largeTitleFont,
      titleFont: titleFont
    )
    appearance.buttonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.backButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    appearance.doneButtonAppearance = barButtonItemAppearance(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: font
    )
    scrollEdgeAppearance = appearance
  }

  func navigationBarAppearance(
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    largeTitleFont: UIFont = .boldSystemFont(ofSize: 24),
    titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium)
  ) -> UINavigationBarAppearance {
    let textColor = textColor ?? .black
    let backgroundColor = backgroundColor ?? .black

    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.configureWithTransparentBackground()
    navigationBarAppearance.backgroundColor = backgroundColor
    navigationBarAppearance.shadowColor = .clear
    navigationBarAppearance.shadowImage = UIImage()
    navigationBarAppearance.backgroundImage = UIImage()
    navigationBarAppearance.largeTitleTextAttributes = [
      .font: largeTitleFont,
      .foregroundColor: textColor
    ]
    navigationBarAppearance.titleTextAttributes = [
      .foregroundColor: textColor,
      .font: titleFont
    ]

    let image = UIImage(systemName: "chevron.backward")?
      .withTintColor(textColor, renderingMode: .alwaysOriginal)
    navigationBarAppearance.setBackIndicatorImage(image, transitionMaskImage: image)

    return navigationBarAppearance
  }

  func barButtonItemAppearance(
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    font: UIFont = .systemFont(ofSize: 14, weight: .medium)
  ) -> UIBarButtonItemAppearance {
    let textColor = textColor ?? .black
    let disabledTextColor = disabledTextColor ?? .black

    let textAttributes: [NSAttributedString.Key: Any] = [
      .font: font,
      .foregroundColor: textColor
    ]

    let disabledTextAttributes: [NSAttributedString.Key: Any] = [
      .font: font,
      .foregroundColor: disabledTextColor
    ]

    let barButtonItemAppearance = UIBarButtonItemAppearance()
    barButtonItemAppearance.normal.titleTextAttributes = textAttributes
    barButtonItemAppearance.highlighted.titleTextAttributes = textAttributes
    barButtonItemAppearance.disabled.titleTextAttributes = disabledTextAttributes
    return barButtonItemAppearance
  }
}
