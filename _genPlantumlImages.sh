#!/bin/bash

# Ensure script runs from its own directory (IG root)
cd "$(dirname "$0")" || { echo "Failed to cd to script directory"; exit 1; }

PLANTUML_JAR="plantuml.jar"
PLANTUML_URL="https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-1.2025.2.jar"

INPUT_DIR="input/images-source"
OUTPUT_DIR="output"

# Download plantuml.jar if not present
if [ ! -f "$PLANTUML_JAR" ]; then
  echo "Downloading plantuml.jar..."
  wget "$PLANTUML_URL" -O "$PLANTUML_JAR" || { echo "Failed to download plantuml.jar"; exit 1; }
else
  echo "plantuml.jar already exists."
fi

# Install graphviz if not installed
if ! command -v dot &> /dev/null; then
  echo "Graphviz not found. Installing graphviz..."
  apt update && apt install -y graphviz || { echo "Failed to install graphviz"; exit 1; }
else
  echo "Graphviz is already installed."
fi

# Make sure output directory exists
mkdir -p "$OUTPUT_DIR"

# Process each .plantuml file
for FILE in "$INPUT_DIR"/*.plantuml; do
  if [ -f "$FILE" ]; then
    echo "Generating SVG for: $FILE"
    java -jar "$PLANTUML_JAR" -tsvg "$FILE" -o "../../$OUTPUT_DIR"
#   java -cp plantuml.jar:$BATIK_HOME/lib/batik-all-1.6.1.jar net.sourceforge.plantuml.Run -tpdf -o "../../$OUTPUT_DIR" "$FILE"

  fi
done

echo "✅ SVG generation complete. Files are in $OUTPUT_DIR/"
