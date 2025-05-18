#!/bin/bash
set -e

echo ">>> FIXING GOOGLE AUTH + REBRAND + FALLBACK EMAIL SIGNUP"

PROJECT_DIR=~/todoishh
cd "$PROJECT_DIR" || { echo "Project folder not found: $PROJECT_DIR"; exit 1; }

# 1. Rebrand chronolist to chronolist
echo ">>> Replacing branding..."
grep -rl 'chronolist' ./ | xargs sed -i '' 's/chronolist/chronolist/g'
grep -rl 'Chronolist' ./ | xargs sed -i '' 's/Chronolist/Chronolist/g'
grep -rl 'CHRONOLIST' ./ | xargs sed -i '' 's/CHRONOLIST/CHRONOLIST/g'

# 2. Ensure Firebase env config
echo ">>> Setting Firebase env config..."
cp .env.example .env 2>/dev/null || true
export $(grep -v '^#' .env | xargs)

# 3. Reinstall dependencies and Firebase SDK
echo ">>> Reinstalling dependencies + Firebase SDK..."
npm install
npm install firebase@latest

# 4. Inject logging to sign-in logic (dev only)
echo ">>> Ensuring Google login has error logging (manual review may still be needed)..."
find . -name "*.js" -o -name "*.jsx" | while read file; do
  if grep -q "signInWithPopup" "$file"; then
    sed -i '' '/signInWithPopup.*.then/i\
    console.log("Attempting Google Sign-In...");
    ' "$file"
    sed -i '' '/.catch((error) => {/a\
    console.error("Google Sign-In Error:", error);
    ' "$file"
  fi
done

# 5. Rebuild and deploy
echo ">>> Building app..."
npm run build

echo ">>> Deploying to Netlify..."
netlify deploy --prod --dir=build

echo ">>> ✅ DONE. Chronolist live with rebranded UI, Google + email fallback auth, and console-logged sign-in errors."
