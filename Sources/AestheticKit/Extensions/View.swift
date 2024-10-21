import SwiftUI

public extension View {
  @ViewBuilder func applyIf<V: View>(_ condition: Bool, @ViewBuilder modifiers: (Self) -> V) -> some View {
    if condition {
      modifiers(self)
    } else {
      self
    }
  }

  func geometryReader(
    in coordinateSpace: CoordinateSpace = .global,
    completion: @escaping (CGRect) -> Void
  ) -> some View {
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

  @ViewBuilder 
  func display(if condition: Bool) -> some View {
    if condition {
      self
    }
  }

  @ViewBuilder 
  func hide(if condition: Bool) -> some View {
    if condition {
      self.hidden()
    } else {
      self
    }
  }

  @ViewBuilder 
  func display<Content: View>(if condition: Bool, @ViewBuilder else content: () -> Content) -> some View {
    if condition {
      self
    } else {
      content()
    }
  }
}
