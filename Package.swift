// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-polarity-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
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
        .package(
            url: "https://github.com/swift-primitives/swift-pair-primitives.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Polarity Primitives",
            dependencies: [
                .product(name: "Pair Primitives", package: "swift-pair-primitives")
            ]
        ),
        .target(
            name: "Polarity Primitives Test Support",
            dependencies: [
                "Polarity Primitives"
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
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
