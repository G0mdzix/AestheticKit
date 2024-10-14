import VisionKit

public enum DataScannerViewBuilder {
  static func makeHoleBackground(backgroundView: UIView, shapeView: UIView) -> CAShapeLayer {
    let maskLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: backgroundView.bounds, cornerRadius: 16)
    path.append(UIBezierPath(roundedRect: shapeView.frame, cornerRadius: 16).reversing())
    maskLayer.path = path.cgPath
    return maskLayer
  }

  static func makeShapeView(cgrect: CGRect, color: UIColor) -> UIView {
    let squareView = UIView(frame: cgrect)
    squareView.backgroundColor = color
    return squareView
  }
}
