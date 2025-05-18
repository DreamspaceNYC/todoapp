#!/bin/bash
set -e

PROJECT_DIR=~/todoishh
HTML_FILE="$PROJECT_DIR/public/index.html"
FAVICON_NAME="chronolist-favicon.png"

echo ">>> Patching index.html for Chronolist branding..."

# Replace <title> tag
sed -i '' 's|<title>.*</title>|<title>Chronolist</title>|' "$HTML_FILE"

# Replace favicon reference
sed -i '' 's|<link rel="icon" href="%PUBLIC_URL%/.*"|<link rel="icon" href="%PUBLIC_URL%/'"$FAVICON_NAME"'"|' "$HTML_FILE"

echo ">>> ✅ index.html patched with Chronolist title and favicon."
