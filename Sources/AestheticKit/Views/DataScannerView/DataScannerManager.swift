import VisionKit
import SwiftUI

public class DataScannerManager: NSObject, DataScannerViewControllerDelegate {

  @Binding var recognizedItems: [RecognizedItem]
  @Binding var error: Error?

  init(recognizedItems: Binding<[RecognizedItem]>, error: Binding<Error?>) {
    self._recognizedItems = recognizedItems
    self._error = error
  }

  public func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
    recognizedItems.append(contentsOf: addedItems)
  }

  public func dataScanner(
    _ dataScanner: DataScannerViewController,
    didRemove removedItems: [RecognizedItem],
    allItems: [RecognizedItem]
  ) {
    self.recognizedItems = recognizedItems.filter { item in
      !removedItems.contains(where: { $0.id == item.id })
    }
  }

  public func dataScanner(
    _ dataScanner: DataScannerViewController,
    becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable
  ) {
    self.error = error
  }
}
