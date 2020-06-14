import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    products: [
        .library(
            name: "RVS_Generic_Swift_Toolbox",
            targets: ["RVS_Generic_Swift_Toolbox"]
        )
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox",
            path: "RVS_Generic_Swift_Toolbox"
        )
    ],
    swiftLanguageVersions: [
        5.0
    ]
)
