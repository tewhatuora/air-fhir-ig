#!/bin/bash +x
set -eo pipefail

PLANTUML_JAR="/usr/lib/plantuml.jar"
INPUT_DIR="input/images-source"
OUTPUT_DIR="output"

if [[ ! -e $PLANTUML_JAR ]]; then
  wget https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-1.2025.2.jar -O plantuml.jar
  PLANTUML_JAR=plantuml.jar
fi  

# Make sure output directory exists
mkdir -p "$OUTPUT_DIR"

# Process each .plantuml file
for FILE in "$INPUT_DIR"/*.plantuml; do
  if [[ -f "$FILE" ]]; then
    echo "Generating SVG for: $FILE"
    java -jar "$PLANTUML_JAR" -tsvg "$FILE" -o "../../$OUTPUT_DIR"
  fi
done

echo "✅ SVG generation complete. Files are in $OUTPUT_DIR/"
