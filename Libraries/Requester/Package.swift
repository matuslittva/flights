// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Requester",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Requester",
            targets: ["Requester"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Requester",
            dependencies: []),
        .testTarget(
            name: "RequesterTests",
            dependencies: ["Requester"]),
    ]
)
