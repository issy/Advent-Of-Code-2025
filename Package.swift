// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoc-2025",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(name: "aoc-2025", targets: ["aoc-2025"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "aoc-2025",
        ),
        .testTarget(
            name: "aoc-2025Tests",
            dependencies: ["aoc-2025"]
        ),
    ]
)
