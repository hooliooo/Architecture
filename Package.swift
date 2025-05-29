// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "Architecture",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6),
    .macCatalyst(.v13)
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "Clean",
      targets: ["Clean"]
    ),
    .library(
      name: "CQRS",
      targets: ["CQRS"]
    ),
    .library(
      name: "DomainDrivenDesign",
      targets: ["DomainDrivenDesign"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(
      url: "https://github.com/swiftlang/swift-syntax.git",
      exact: "601.0.1"
    ),
    .package(
      url: "https://github.com/swiftlang/swift-testing.git",
      exact: "6.1.1"
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "Clean",
      dependencies: []
    ),
    .target(
      name: "CQRS",
      dependencies: []
    ),
    .macro(
      name: "DDDMacros",
      dependencies: [
        .product(
          name: "SwiftSyntax",
          package: "swift-syntax"
        ),
        .product(
          name: "SwiftSyntaxMacros",
          package: "swift-syntax"
        ),
        .product(
          name: "SwiftOperators",
          package: "swift-syntax"
        ),
        .product(
          name: "SwiftParser",
          package: "swift-syntax"
        ),
        .product(
          name: "SwiftParserDiagnostics",
          package: "swift-syntax"
        ),
        .product(
          name: "SwiftCompilerPlugin",
          package: "swift-syntax"
        ),
      ]
    ),
    .target(
      name: "DomainDrivenDesign",
      dependencies: ["DDDMacros"]
    ),
    .testTarget(
      name: "DomainDrivenDesignTests",
      dependencies: [
        "DomainDrivenDesign",
        "DDDMacros",
        .product(
          name: "Testing",
          package: "swift-testing"
        )
      ]
    ),
    .testTarget(
      name: "DDDMacrosTest",
      dependencies: [
        "DDDMacros",
        .product(
          name: "SwiftSyntaxMacrosGenericTestSupport",
          package: "swift-syntax"
        ),
        .product(
          name: "Testing",
          package: "swift-testing"
        )
      ]
    ),

  ]
)
