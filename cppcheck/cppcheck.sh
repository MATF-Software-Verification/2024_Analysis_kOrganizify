#!/usr/bin/bash

# Skripta za pokretanje Cppcheck statičke analize

set -e
echo "Pokrećem cppcheck analizu projekta kOrganizify..."

PROJECT_DIR="../src"
REPORT_DIR="./results"
BUILD_DIR="./cppcheck_build"
HTML_DIR="./html-report"


mkdir -p "$REPORT_DIR"
mkdir -p "$BUILD_DIR"
mkdir -p "$HTML_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
OUTPUT_FILE_TXT="$REPORT_DIR/cppcheck_${TIMESTAMP}.txt"
OUTPUT_FILE_XML="$REPORT_DIR/cppcheck_${TIMESTAMP}.xml"

cppcheck --enable=all --inconclusive --std=c++17 --force --cppcheck-build-dir="$BUILD_DIR" "$PROJECT_DIR" 2>"$OUTPUT_FILE_TXT"
echo "Generisan .txt fajl."

cppcheck --enable=all --inconclusive --std=c++17 --force --cppcheck-build-dir="$BUILD_DIR" --xml "$PROJECT_DIR" 2> "$OUTPUT_FILE_XML"
echo "Generisan .xml fajl."

cppcheck-htmlreport --file="$OUTPUT_FILE_XML" --report-dir="$HTML_DIR"
firefox "$HTML_DIR/index.html"


echo "Analiza završena."
echo "Rezultati su sačuvani u: $OUTPUT_FILE_TXT"
