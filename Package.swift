// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-polarity-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Polarity Primitives",
            targets: ["Polarity Primitives"]
        ),
        .library(
            name: "Polarity Primitives Test Support",
            targets: ["Polarity Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-pair-primitives"),
    ],
    targets: [
        .target(
            name: "Polarity Primitives",
            dependencies: [
                .product(name: "Pair Primitives", package: "swift-pair-primitives"),
            ]
        ),
        .target(
            name: "Polarity Primitives Test Support",
            dependencies: [
                "Polarity Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Polarity Primitives Tests",
            dependencies: [
                "Polarity Primitives",
                "Polarity Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
