import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    products: [
        .library(
            name: "RVS_Generic_Swift_Toolbox",
            targets: ["RVS_Generic_Swift_Toolbox_iOS"]
        )
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox_iOS",
            path: "RVS_Generic_Swift_Toolbox_iOS"
        )
    ],
    swiftLanguageVersions: [
        5.0
    ]
)
