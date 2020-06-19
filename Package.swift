// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    products: [
        .library(
            name: "RVSGenericSwiftToolbox",
            type: .dynamic,
            targets: ["RVS_Generic_Swift_Toolbox"]),
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox",
            path: "./src")
    ]
)
