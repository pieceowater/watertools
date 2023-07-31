// swift-tools-version:5.8


import PackageDescription

let package = Package(
    name: "watertools",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "watertools",
            targets: ["watertools"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "watertools",
            path: "Sources",
            resources: [
                .process("Images/Media.xcassets")
            ]
        ),
        .testTarget(
            name: "watertoolsTests",
            dependencies: ["watertools"]),
    ]
)
