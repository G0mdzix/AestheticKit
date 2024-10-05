import SwiftUI

public extension View {
  @ViewBuilder func applyIf<V: View>(_ condition: Bool, @ViewBuilder modifiers: (Self) -> V) -> some View {
    if condition {
      modifiers(self)
    } else {
      self
    }
  }

  func geometryReader(in coordinateSpace: CoordinateSpace = .global, completion: @escaping (CGRect) -> Void) -> some View {
    background(GeometryReader { proxy in
      Color.clear
        .execute {
          DispatchQueue.main.async {
            completion(proxy.frame(in: coordinateSpace))
          }
        }
    })
  }

  func execute(_ block: () -> Void) -> some View {
    block()
    return self
  }

  func makeCircleBackground(color: Color, size: CGFloat) -> some View {
    self
      .background {
        Circle()
          .fill(color)
          .frame(width: size, height: size)
      }
  }
}
