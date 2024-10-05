// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AestheticKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "AestheticKit",
            targets: ["AestheticKit"]),
    ],
    targets: [
        .target(
            name: "AestheticKit"),
        .testTarget(
            name: "AestheticKitTests",
            dependencies: ["AestheticKit"]),
    ]
)
