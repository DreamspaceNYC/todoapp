#!/bin/bash
echo "[*] Checking Node.js, npm, Netlify CLI..."
which node >/dev/null 2>&1 || { echo "Node.js not found. Install Node.js first."; exit 1; }
which npm >/dev/null 2>&1 || { echo "npm not found. Install npm."; exit 1; }
which netlify >/dev/null 2>&1 || { echo "Netlify CLI not found. Installing..."; npm install -g netlify-cli; }
echo "[*] Installing dependencies..."
npm install
echo "[*] Environment check complete."
