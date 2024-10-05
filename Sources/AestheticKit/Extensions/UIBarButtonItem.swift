import SwiftUI

extension UIBarButtonItem {

  func configureDefaultStyle(textColor: UIColor = .black, disabledTextColor: UIColor = .black) {
    configureDefaultStyle(
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      font: .systemFont(ofSize: 14.0, weight: .regular)
    )
  }

  func configureDefaultStyle(
    textColor: UIColor? = nil,
    disabledTextColor: UIColor? = nil,
    font: UIFont = .systemFont(ofSize: 16)
  ) {
    
    let textAttributes: [NSAttributedString.Key: Any] = [
      .font: font,
      .foregroundColor: textColor
    ].compactMapValues { $0 }

    let disabledTextAttributes: [NSAttributedString.Key: Any] = [
      .font: font,
      .foregroundColor: disabledTextColor
    ].compactMapValues { $0 }

    setTitleTextAttributes(textAttributes, for: .normal)
    setTitleTextAttributes(textAttributes, for: .highlighted)
    setTitleTextAttributes(disabledTextAttributes, for: .disabled)
  }
}
