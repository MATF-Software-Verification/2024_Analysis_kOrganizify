#!/usr/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR/../../src/kOrganizify"

echo "Kreiram build folder za Client..."
mkdir -p "$PROJECT_ROOT/kOrganizify/build"
cd "$PROJECT_ROOT/kOrganizify/build"

echo "Pokrećem CMake konfiguraciju za Client..."
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build .

CLIENT_EXE="$PROJECT_ROOT/kOrganizify/build/kOrganizify"

echo "Kreiram build folder za Server..."
mkdir -p "$PROJECT_ROOT/Server/build"
cd "$PROJECT_ROOT/Server/build"

echo "Pokrećem CMake konfiguraciju za Server..."
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build .

SERVER_EXE="$PROJECT_ROOT/Server/build/server"

echo "Projekat uspešno kompajliran."
echo "Client izvršni fajl: $CLIENT_EXE"
echo "Server izvršni fajl: $SERVER_EXE"
