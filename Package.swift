// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .macOS(.v10_14),
        .watchOS(.v5)
    ],
    products: [
        .library(
            name: "RVS-Generic-Swift-Toolbox",
            targets: ["RVS_Generic_Swift_Toolbox"])
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox",
            path: "./src")
    ]
)
