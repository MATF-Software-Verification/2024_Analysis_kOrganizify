#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_SCRIPT="$SCRIPT_DIR/build_project.sh"
PROJECT_DIR="$SCRIPT_DIR/../../src/kOrganizify/kOrganizify"
EXECUTABLE="$PROJECT_DIR/build/kOrganizify"
RESULTS_DIR="$SCRIPT_DIR/results"

mkdir -p "$RESULTS_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
OUTPUT_FILE="$RESULTS_DIR/massif_${TIMESTAMP}.out"
REPORT_FILE="$RESULTS_DIR/massif_${TIMESTAMP}.txt"

echo "Pokrećem build projekta..."
bash "$BUILD_SCRIPT"

if [ ! -f "$EXECUTABLE" ]; then
    echo "Greška: Izvršni fajl nije pronađen."
    exit 1
fi

echo "Pokrećem Valgrind Massif analizu..."
valgrind --tool=massif --stacks=yes --time-unit=B \
    --massif-out-file="$OUTPUT_FILE" "$EXECUTABLE"

echo "Generišem izveštaj pomoću ms_print..."
ms_print "$OUTPUT_FILE" > "$REPORT_FILE"

echo "Analiza završena."
echo "Tekstualni izveštaj: $REPORT_FILE"
echo "Massif izlazna datoteka: $OUTPUT_FILE"

if command -v massif-visualizer &> /dev/null; then
    echo "Otvaram vizuelni prikaz u Massif Visualizer-u..."
    nohup massif-visualizer "$OUTPUT_FILE" >/dev/null 2>&1 &
else
    echo "Massif Visualizer nije pronađen. Možete ga instalirati komandom:"
    echo "sudo apt install massif-visualizer"
fi
