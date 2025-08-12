#!/bin/bash

INPUT_DIR="input/raw-images"
OUTPUT_DIR="output"
DEST_DIR="$OUTPUT_DIR/assets/images"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy all image files from INPUT_DIR to DEST_DIR
# This includes common image formats
cp "$INPUT_DIR"/*.{jpg,jpeg,png,gif,bmp,webp,tiff} "$DEST_DIR" 2>/dev/null

echo "Images copied from '$INPUT_DIR' to '$DEST_DIR'."
