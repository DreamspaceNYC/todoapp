#!/bin/bash
set -e

echo ">>> Opening Firebase Firestore rules editor in browser..."
open "https://console.firebase.google.com/project/awesome-c10f8/firestore/rules"

echo ">>> Building React app..."
npm run build

echo ">>> Deploying to Netlify..."
netlify deploy --prod --dir=build

echo ">>> Copying live site URL to clipboard..."
echo "https://todoapp-dreamspace.netlify.app" | pbcopy
echo ">>> ✅ URL copied to clipboard: https://todoapp-dreamspace.netlify.app"
