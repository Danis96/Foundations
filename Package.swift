// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Foundations",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Foundations",
            targets: ["Foundations"]),
    ],
    dependencies: [
        // Factory dependency
        .package(url: "https://github.com/hmlongco/Factory", from: "2.3.1"),
    ],
    targets: [
        .target(
            name: "Foundations",
            dependencies: [
                // ADD: Factory to target dependencies
                .product(name: "Factory", package: "Factory"),
            ]),
        .testTarget(
            name: "FoundationsTests",
            dependencies: ["Foundations"]),
    ]
)
