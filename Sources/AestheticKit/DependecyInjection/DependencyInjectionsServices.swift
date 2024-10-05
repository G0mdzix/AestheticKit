struct ServicesKeys {
  struct ThemeConfigurationUserDefaultsProvider: InjectionKey {
    static var currentValue: ThemeConfigurationUserDefaultsProtocol = ThemeConfigurationUserDefaults()
  }

  struct ColorConfigurationUserDefaultsProvider: InjectionKey {
    static var currentValue: ColorsSetConfigurationUserDefaultsProtocol = ColorsSetConfigurationUserDefaults()
  }
}

extension InjectedValues {
  public var themeConfigurationUserDefaultsProvider: ThemeConfigurationUserDefaultsProtocol {
    get { Self[ServicesKeys.ThemeConfigurationUserDefaultsProvider.self] }
    set { Self[ServicesKeys.ThemeConfigurationUserDefaultsProvider.self] = newValue }
  }

  public var colorConfigurationUserDefaultsProvider: ColorsSetConfigurationUserDefaultsProtocol {
    get { Self[ServicesKeys.ColorConfigurationUserDefaultsProvider.self] }
    set { Self[ServicesKeys.ColorConfigurationUserDefaultsProvider.self] = newValue }
  }
}
