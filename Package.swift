// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SPM_Foundations",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SPM_Foundations",
            targets: ["SPM_Foundations"]),
    ],
    dependencies: [
        // Factory dependency
        .package(url: "https://github.com/hmlongco/Factory", from: "2.3.1"),
    ],
    targets: [
        .target(
            name: "SPM_Foundations",
            dependencies: [
                // ADD: Factory to target dependencies
                .product(name: "Factory", package: "Factory"),
            ]),
        .testTarget(
            name: "SPM_FoundationsTests",
            dependencies: ["SPM_Foundations"]),
    ]
)
