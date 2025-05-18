#!/bin/bash
cd "$(dirname "$0")/todoishh"

echo ">>> Installing dependencies..."
npm install || exit 1

echo ">>> Building the app..."
npm run build || exit 1

echo ">>> Deploying to Netlify..."
netlify deploy --prod --dir=build
