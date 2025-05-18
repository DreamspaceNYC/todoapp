#!/bin/bash
echo ">>> 1. Cleaning node_modules and build artifacts..."
rm -rf node_modules build

echo ">>> 2. Reverting to original cloned state from git..."
git fetch origin
git reset --hard origin/main

echo ">>> 3. Installing original dependencies..."
npm install

echo ">>> 4. Done. The project is now identical to the original GitHub repo's main branch."
echo ">>> Run: npm start"
