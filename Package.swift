// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RVS_Generic_Swift_Toolbox",
    products: [
        .library(
            name: "RVS_Generic_Swift_Toolbox",
            targets: [  "RVS_Generic_Swift_Toolbox_iOS",
                        "RVS_Generic_Swift_Toolbox_MacOS",
                        "RVS_Generic_Swift_Toolbox_WatchOS",
                        "RVS_Generic_Swift_Toolbox_TVOS"
            ]
        )
    ],
    targets: [
        .target(
            name: "RVS_Generic_Swift_Toolbox_iOS",
            path: "RVS_Generic_Swift_Toolbox_iOS"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_MacOS",
            path: "RVS_Generic_Swift_Toolbox_MacOS"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_WatchOS",
            path: "RVS_Generic_Swift_Toolbox_WatchOS"
        ),
        .target(
            name: "RVS_Generic_Swift_Toolbox_TVOS",
            path: "RVS_Generic_Swift_Toolbox_TVOS"
        )
    ]
)
