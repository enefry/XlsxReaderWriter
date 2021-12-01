// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XlsxReaderWriter",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "XlsxReaderWriter",
            targets: ["XlsxReaderWriter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ZipArchive/ZipArchive.git",
             .upToNextMinor(from: "2.4.2")),
    ],
    targets: [
        .target(name: "XlsxReaderWriter", dependencies: ["ZipArchive"], path: "Sources/XlsxReaderWriter",  publicHeadersPath: "Sources/XlsxReaderWriter", cSettings: [
            .headerSearchPath("XlsxReaderWriter"),
            .headerSearchPath("."),
        ], linkerSettings: [
            .linkedLibrary("z"),
            .linkedLibrary("iconv")
        ])
    ]
)
