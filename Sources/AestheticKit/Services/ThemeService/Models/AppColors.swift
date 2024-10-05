public enum AppColors: Int, CaseIterable, Identifiable {

  @Injected(\.colorConfigurationUserDefaultsProvider)
  public static var colorUserDefaults: ColorsSetConfigurationUserDefaultsProtocol

  case first
  case second
  case third

  public var id: Int { self.rawValue }
}
