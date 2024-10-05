import UIKit
import SwiftUI

public enum Theme: String, CaseIterable, Identifiable {
  case light = "LightTheme"
  case dark = "DarkTheme"
  case auto

  public static var current = Theme.auto
  public var id: String { self.rawValue }

  public var primaryImage: Image {
    switch self {
    case .light:
      Image(systemName: "sun.max.fill")
    case .dark:
      Image(systemName: "moon.stars")
    case .auto:
      Image(systemName: "circle.grid.cross.fill")
    }
  }

  public var secondaryImage: Image {
    switch self {
    case .light:
      Image(systemName: "sun.horizon")
    case .dark:
      Image(systemName: "moon.zzz")
    case .auto:
      Image(systemName: "circle.grid.cross")
    }
  }

  public var description: String {
    switch self {
    case .light:
      "Light mode"
    case .dark:
      "Dark mode"
    case .auto:
      "System mode"
    }
  }
}

public extension Theme {
  var plistName: String {
    switch self {
    case .light, .dark:
      return rawValue
    case .auto:
      guard let window = UIApplication.shared.focusedWindow else { return Theme.light.rawValue }
      return ViewThemeProvider(view: window).displayTheme.plistName
    }
  }
}
