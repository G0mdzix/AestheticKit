import VisionKit
import SwiftUI

extension DataScannerViewController {
  private enum AssociatedKeys {
    static var backgroundView = "backgroundView"
  }

  var backgroundView: UIView? {
    get {
      objc_getAssociatedObject(self, withUnsafePointer(to: &AssociatedKeys.backgroundView) { $0 }) as? UIView
    }
    set {
      objc_setAssociatedObject(
        self,
        withUnsafePointer(to: &AssociatedKeys.backgroundView) { $0 },
        newValue,
        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }

  public func withBackgroundView(backgroundColor: Color) -> DataScannerViewController {
    let scanner = self
    let backgroundView = DataScannerViewBuilder.makeShapeView(
      cgrect: UIScreen.main.bounds,
      color: UIColor(backgroundColor).withAlphaComponent(0.5)
    )
    scanner.view.addSubview(backgroundView)
    scanner.backgroundView = backgroundView
    return scanner
  }

  public func withSquareView(cgrect: CGRect, color: UIColor) {
    guard let backgroundView = self.backgroundView else {
      assertionFailure("Background view not set. Call 'withBackgroundView()' first.")
      return
    }
    let squareView = DataScannerViewBuilder.makeShapeView(cgrect: cgrect, color: color)
    backgroundView.addSubview(squareView)
    backgroundView.layer.mask = DataScannerViewBuilder.makeHoleBackground(
      backgroundView: backgroundView,
      shapeView: squareView
    )
    self.regionOfInterest = squareView.frame
  }
}
