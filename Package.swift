// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    products: [
        .library(
            name: "RVS_Generic_Swift_Toolbox_iOS",
            targets: [  "RVS_Generic_Swift_Toolbox_iOS" ]
        ),
        .library(
            name: "RVS_Generic_Swift_Toolbox_MacOS",
            targets: [  "RVS_Generic_Swift_Toolbox_MacOS" ]
        ),
        .library(
            name: "RVS_Generic_Swift_Toolbox_WatchOS",
            targets: [  "RVS_Generic_Swift_Toolbox_WatchOS" ]
        ),
        .library(
            name: "RVS_Generic_Swift_Toolbox_TVOS",
            targets: [  "RVS_Generic_Swift_Toolbox_TVOS" ]
        )
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox_iOS",
            path: "src"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_MacOS",
            path: "src"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_WatchOS",
            path: "src"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_TVOS",
            path: "src"
        )
    ]
)
