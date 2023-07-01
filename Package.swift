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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "10.7.0")
    ],
    targets: [
        .target(
            name: "watertools",
//            dependencies: ["swift-package-manager-google-mobile-ads"],
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
