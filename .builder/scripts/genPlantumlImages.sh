#!/bin/bash
set -eo pipefail

# Make sure output directory exists
mkdir -p "$OUTPUT_DIR"

# Process each .plantuml file
for FILE in "$INPUT_DIR"/*.plantuml; do
  if [ -f "$FILE" ]; then
    echo "Generating SVG for: $FILE"
    java -jar "$PLANTUML_JAR" -tsvg "$FILE" -o "../../$OUTPUT_DIR"
  fi
done

echo "✅ SVG generation complete. Files are in $OUTPUT_DIR/"
