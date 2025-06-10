#!/bin/bash

set -e

# Config
PROTO_FILE="notification.proto"
OUT_DIR="grpcFiles"

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Make sure output directory exists
mkdir -p "$OUT_DIR"

# Generate Go code into grpcFiles
protoc --go_out="$OUT_DIR" --go_opt=paths=source_relative \
       --go-grpc_out="$OUT_DIR" --go-grpc_opt=paths=source_relative \
       "$PROTO_FILE"

echo "✅ Generated Go gRPC code for $PROTO_FILE in $OUT_DIR"
