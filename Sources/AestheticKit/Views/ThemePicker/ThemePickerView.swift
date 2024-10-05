import SwiftUI

public struct ThemePickerView: View {

  @StateObject private var viewModel = ThemePickerViewModel()

  private let mainColor: Color

  public var body: some View {
    VStack(spacing: .zero) {
      HStack(spacing: .zero) {
        iconSegmentPicker
      }

      themePicker
    }
  }

  private var iconSegmentPicker: some View {
    ForEach(Theme.allCases) { theme in
      Spacer()

      createIcon(theme)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 32, height: 32)
        .padding(DefaultSpacings.medium)
        .foregroundColor(mainColor)
        .onTapGesture {
          withAnimation {
            viewModel.selectedTheme = theme
          }
        }

      Spacer()
    }
  }

  private var themePicker: some View {
    Picker(String(), selection: $viewModel.selectedTheme) {
      ForEach(Theme.allCases) { theme in
        Text(theme.description)
          .tag(theme)
      }
    }
    .colorMultiply(mainColor)
    .pickerStyle(.segmented)
  }

  public init(mainColor: Color) {
    self.mainColor = mainColor
  }

  private func createIcon(_ theme: Theme) -> Image {
    viewModel.selectedTheme == theme ? theme.primaryImage : theme.secondaryImage
  }
}
