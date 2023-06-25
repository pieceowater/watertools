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
    targets: [
        .target(
            name: "watertools",
            resources: [.process("Images")]
        ),
        .testTarget(
            name: "watertoolsTests",
            dependencies: ["watertools"]),
    ]
)
