// swift-tools-version:6.0.3
import PackageDescription

let package = Package(
    name: "edge-agent-common",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "EdgeAgentGRPC",
            targets: ["EdgeAgentGRPC"]
        ),
        .library(
            name: "Shell",
            targets: ["Shell"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "2.0.0"),
        .package(url: "https://github.com/grpc/grpc-swift-protobuf.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
    ],
    targets: [
        .target(
            name: "EdgeAgentGRPC",
            dependencies: [
                .product(name: "GRPCCore", package: "grpc-swift"),
                .product(name: "GRPCProtobuf", package: "grpc-swift-protobuf"),
            ],
            exclude: [
                "Proto/edge_agent.protoset"
            ]
        ),
        .target(
            name: "Shell",
            dependencies: [
                .product(name: "Logging", package: "swift-log")
            ]
        ),
    ]
)
