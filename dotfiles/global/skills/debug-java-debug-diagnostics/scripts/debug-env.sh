#!/usr/bin/env bash
set -e
echo "=== java -version ==="
java -version 2>&1 || true
echo
echo "=== javac -version ==="
javac -version 2>&1 || true
echo
echo "=== JAVA_HOME ==="
echo "JAVA_HOME=${JAVA_HOME:-<não definido>}"
echo
echo "=== mvn -v ==="
mvn -v 2>&1 || echo "mvn não encontrado"
echo
echo "=== DISPLAY (GUI) ==="
echo "DISPLAY=${DISPLAY:-<não definido>}"
