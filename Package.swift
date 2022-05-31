// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation
let package = Package(
  name: "Utility",
  products: [
    .library(name: "Facility", targets: ["Facility"]),
    .library(name: "Interactivity", targets: ["Interactivity"]),
  ],
  targets: [
    .target(name: "Interactivity", dependencies: ["Facility"]),
    .target(name: "Facility"),
    .testTarget(name: "FacilityTests", dependencies: ["Facility"]),
  ]
)
