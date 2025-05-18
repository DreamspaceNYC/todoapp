#!/bin/bash
set -e

echo ">>> Fixing import order in App.js..."

APP_FILE="./src/App.js"
TEMP_FILE="./src/App.temp.js"

# Extract custom theme imports and move to top
grep "^import './theme/" "$APP_FILE" > $TEMP_FILE
grep -v "^import './theme/" "$APP_FILE" >> $TEMP_FILE

mv $TEMP_FILE $APP_FILE

echo ">>> ✅ Import order fixed."
