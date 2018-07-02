#!/bin/bash
set -e
set -x
mkdir /app/build -p
cd /app
java -jar /app/lib/plantuml.jar /app/src/*.puml
find src -name "*.png" -exec mv "{}" /app/build/ \;
rm -rf  -- "/app/?"
