// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Offers",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Offers",
            targets: ["Offers"]),
    ],
    dependencies: [
        .package(path: "../Libraries/Requester"),
        .package(path: "../Libraries/Utilities")
    ],
    targets: [
        .target(
            name: "Offers",
            dependencies: ["Requester", "Utilities"]),
        .testTarget(
            name: "OffersTests",
            dependencies: ["Offers"]),
    ]
)
