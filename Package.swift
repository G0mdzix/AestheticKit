// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "AestheticKit",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "AestheticKit",
      targets: ["AestheticKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", revision: "0.57.0"),
  ],
  targets: [
    .target(
      name: "AestheticKit",
      plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
    ),
    .testTarget(
      name: "AestheticKitTests",
      dependencies: ["AestheticKit"],
      plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
    ),
  ]
)
