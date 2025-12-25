// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Aoc2025",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.7.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Lib"),
        .target(
            name: "Solutions",
            dependencies: [
                .byName(name: "Lib")
            ]
        ),
        .executableTarget(name: "CliRunner", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .byName(name: "Lib"),
            .byName(name: "Solutions")
        ]),
    ]
)
