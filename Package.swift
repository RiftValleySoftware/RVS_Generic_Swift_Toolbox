// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .watchOS(.v5),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "RVS_Generic_Swift_Toolbox",
            targets: [  "RVS_Generic_Swift_Toolbox" ]
        )
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox",
            path: "src"
        )
    ],
    swiftLanguageVersions: [.v5]
)
