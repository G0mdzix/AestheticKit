import Foundation

public struct MoreButtonItems: Identifiable {
  public let id = UUID()
  public let primarySFSymbolName: SFSymbols
  public let secondarySFSymbolName: SFSymbols
  public let action: () -> Void

  public var isPressed = false

  public init(primarySFSymbolName: SFSymbols, secondarySFSymbolName: SFSymbols, action: @escaping () -> Void) {
    self.primarySFSymbolName = primarySFSymbolName
    self.secondarySFSymbolName = secondarySFSymbolName
    self.action = action
  }
}
