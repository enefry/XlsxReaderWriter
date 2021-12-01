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
    ]
    targets: [
        .target(
            name: "XlsxReaderWriter",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("XlsxReaderWriter"),
                .headerSearchPath("."),
            ],
            dependencies: ["ZipArchive"]
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("iconv")
            ]),
        .testTarget(
            name: "XlsxReaderWriterSwiftTests",
            dependencies: [
                .target(name: "XlsxReaderWriter"),
            ],
            resources: [
                .copy("Resources/photo-1415226481302-c40f24f4d45e.jpeg"),
                .copy("Resources/testWorkbook.xlsx"),
            ]),
        .testTarget(
            name: "XlsxReaderWriterTests",
            dependencies: [
                .target(name: "XlsxReaderWriter"),
            ],
            resources: [
                .copy("Resources/photo-1415226481302-c40f24f4d45e.jpeg"),
                .copy("Resources/testWorkbook.xlsx"),
                .copy("Resources/testWorkbook2.xlsx"),
                .copy("Resources/google.xlsx"),
            ]),
    ]
)
