#if os(iOS)
import UIKit

extension UIApplication {

  var activeScene: [UIWindowScene] {
    connectedScenes
      .filter { $0.activationState == .foregroundActive }
      .compactMap { $0 as? UIWindowScene }
  }

  var activeSceneWindows: [UIWindow] {
    activeScene.reduce(into: [UIWindow]()) { windows, scene in
      windows += scene.windows
    }
  }

  var focusedWindow: UIWindow? {
    activeSceneWindows.first { $0.isKeyWindow }
  }
}
#endif
