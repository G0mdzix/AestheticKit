import SwiftUI
import VisionKit

public struct DataScannerView: UIViewControllerRepresentable {

  @Binding var recognizedItems: [RecognizedItem]
  @Binding var error: Error?

  @State private var recognizedDataTypes: Set<DataScannerViewController.RecognizedDataType>

  private let backgroundColor: Color

  private var regionOfInterest: CGRect

  public init(
    backgroundColor: Color,
    recognizedItems: Binding<[RecognizedItem]>,
    error: Binding<Error?>,
    recognizedDataTypes: Set<DataScannerViewController.RecognizedDataType>,
    regionOfInterest: CGRect
  ) {
    self.backgroundColor = backgroundColor
    self._recognizedItems = recognizedItems
    self._error = error
    self.recognizedDataTypes = recognizedDataTypes
    self.regionOfInterest = regionOfInterest
  }

  public func makeUIViewController(context: Context) -> DataScannerViewController {
    DataScannerViewController(
      recognizedDataTypes: recognizedDataTypes,
      qualityLevel: .accurate,
      recognizesMultipleItems: true,
      isHighFrameRateTrackingEnabled: false,
      isGuidanceEnabled: true
    )
    .withBackgroundView(backgroundColor: backgroundColor)
  }

  public func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
    uiViewController.delegate = context.coordinator
    uiViewController.withSquareView(cgrect: regionOfInterest, color: .clear)
    try? uiViewController.startScanning()
  }

  public func makeCoordinator() -> DataScannerManager {
    DataScannerManager(recognizedItems: $recognizedItems, error: $error)
  }

  public static func dismantleUIViewController(
    _ uiViewController: DataScannerViewController,
    coordinator: DataScannerManager
  ) {
    uiViewController.stopScanning()
  }
}
