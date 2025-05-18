#!/bin/bash

echo ">>> Checking if Netlify CLI is installed..."
if ! command -v netlify &> /dev/null; then
  echo "Netlify CLI not found. Install with: npm install -g netlify-cli"
  exit 1
else
  echo "Netlify CLI is installed: $(netlify --version)"
fi

echo ">>> Checking Netlify login status..."
netlify status

echo ">>> Checking for stored Netlify tokens..."
TOKEN_PATH="$HOME/.netlify/config.json"
if [[ -f "$TOKEN_PATH" ]]; then
  echo "Found Netlify token file at $TOKEN_PATH"
  grep -i '"access_token"' "$TOKEN_PATH" || echo "Token key not found in config."
else
  echo "No token file found. You may need to run: netlify login"
fi
