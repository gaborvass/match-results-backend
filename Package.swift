// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "match-results-backend",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", .upToNextMajor(from: "4.0.3")),
        .Package(url: "https://github.com/vapor/json.git", majorVersion: 2)
    ],
    targets: [
        .target(name: "App", dependencies: ["Kanna", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

