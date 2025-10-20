#!/usr/bin/bash

# Skripta za pokretanje Clang-Format alata

set -e
echo "Pokrećem Clang-Format analizu projekta kOrganizify..."

PROJECT_DIR="../src/kOrganizify"
OUTPUT_DIR="./formatted_output"
OUTPUT_ROOT="$OUTPUT_DIR/kOrganizify"
STYLE="Google"

mkdir -p "$OUTPUT_DIR"

find "$PROJECT_DIR" -type f \( -name "*.cpp" -o -name "*.h" \) | while read -r file; do
    rel="${file#$PROJECT_DIR/}"
    dest="$OUTPUT_ROOT/$rel"

    mkdir -p "$(dirname "$dest")"
    echo "Formatiram: $file"
    clang-format -style="$STYLE" "$file" > "$dest"
done

echo "Formatiranje završeno."
echo "Formatirani fajlovi su sačuvani u: $OUTPUT_DIR"
