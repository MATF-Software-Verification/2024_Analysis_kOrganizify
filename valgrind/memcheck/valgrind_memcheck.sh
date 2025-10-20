#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_SCRIPT="$SCRIPT_DIR/build_project.sh"
PROJECT_ROOT="$SCRIPT_DIR/../../src/kOrganizify"
REPORTS_DIR="$SCRIPT_DIR/results"

mkdir -p "$REPORTS_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
OUTPUT_FILE="$REPORTS_DIR/memcheck_${TIMESTAMP}.txt"

TARGET="$1"

if [ -z "$TARGET" ]; then
    echo "Upotreba: $0 [client|server]"
    exit 1
fi

echo "Pokrećem build projekta..."
bash "$BUILD_SCRIPT"

if [ "$TARGET" = "client" ]; then
    EXECUTABLE="$PROJECT_ROOT/kOrganizify/build/kOrganizify"
elif [ "$TARGET" = "server" ]; then
    EXECUTABLE="$PROJECT_ROOT/Server/build/Server"
else
    echo "Nepoznat argument: $TARGET"
    echo "Upotreba: $0 [client|server]"
    exit 1
fi

if [ ! -f "$EXECUTABLE" ]; then
    echo "Greška: Izvršni fajl nije pronađen na lokaciji: $EXECUTABLE"
    exit 1
fi

echo "Pokrećem Valgrind Memcheck analizu za: $TARGET"
valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes \
    --num-callers=10 --log-file="$OUTPUT_FILE" "$EXECUTABLE"

echo "Analiza završena."
echo "Rezultati su sačuvani u: $OUTPUT_FILE"

grep -E "ERROR SUMMARY|definitely lost|indirectly lost|possibly lost" "$OUTPUT_FILE" || true

