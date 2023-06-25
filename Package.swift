// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
    targets: [
        .target(
            name: "watertools",
            resources: [
                .copy("Media.xcassets")
            ]
        ),
        .testTarget(
            name: "watertoolsTests",
            dependencies: ["watertools"]),
    ]
)
