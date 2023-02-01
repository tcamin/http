// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "http-kit",
    products: [
        .library(name: "HTTPKit", targets: ["HTTPKit"]),
    ],
    dependencies: [
        // Event-driven network application framework for high performance protocol servers & clients, non-blocking.
        .package(url: "https://github.com/apple/swift-nio.git", exact: "2.40.0"),
        
        // Bindings to OpenSSL-compatible libraries for TLS support in SwiftNIO
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
        
        // HTTP/2 support for SwiftNIO
        .package(url: "https://github.com/apple/swift-nio-http2.git", from: "1.0.0"),
        
        // Useful code around SwiftNIO.
        .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.0.0"),
        
        // Swift logging API
        .package(url: "https://github.com/apple/swift-log.git", branch: "main"),
    ],
    targets: [
        .target(name: "HTTPKit", dependencies: [
            .product(name: "Logging", package: "swift-log"),
            .product(name: "NIO", package: "swift-nio"),
            .product(name: "NIOExtras", package: "swift-nio-extras"),
            .product(name: "NIOFoundationCompat", package: "swift-nio"),
            .product(name: "NIOHTTPCompression", package: "swift-nio-extras"),
            .product(name: "NIOHTTP1", package: "swift-nio"),
            .product(name: "NIOHTTP2", package: "swift-nio-http2"),
            .product(name: "NIOSSL", package: "swift-nio-ssl"),
            .product(name: "NIOWebSocket", package: "swift-nio"),
        ]),
        .target(name: "HTTPKitExample", dependencies: ["HTTPKit"]),
        .testTarget(name: "HTTPKitTests", dependencies: ["HTTPKit"]),
    ]
)
