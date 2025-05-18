#!/bin/bash
set -e

PROJECT=~/todoishh

echo ">>> 1. Rebranding app to Chronolist across project..."

# Replace app name in package.json, index.html, manifest
sed -i '' 's/Todoist/Chronolist/g' "$PROJECT/public/index.html" || true
sed -i '' 's/todoist/chronolist/g' "$PROJECT/public/index.html" || true
sed -i '' 's/Todoist/Chronolist/g' "$PROJECT/public/manifest.json" || true
sed -i '' 's/todoist/chronolist/g' "$PROJECT/public/manifest.json" || true
sed -i '' 's/Todoist/Chronolist/g' "$PROJECT/package.json" || true
sed -i '' 's/todoist/chronolist/g' "$PROJECT/package.json" || true

echo ">>> 2. Injecting hero section into landing page (non-destructive)..."

# Append hero to landing-page/index.jsx only if not already present
HERO_PATH="$PROJECT/src/pages/landing-page/index.jsx"
if ! grep -q "Chronolist" "$HERO_PATH"; then
cat <<'HERO_BLOCK' >> "$HERO_PATH"

{/* Chronolist Hero Section */}
<section className="hero">
  <h1>Organize Your Work & Life</h1>
  <p>Finally stay focused, calm, and in control.</p>
  <p><strong>Chronolist</strong> is your intelligent task manager and daily planner.</p>
  <button className="cta-button">Start for Free</button>
</section>
HERO_BLOCK
fi

echo ">>> 3. Adding final Chronolist favicon..."

cp "$PWD/chronolist-favicon.png" ./public/favicon.ico

# Update favicon reference in index.html
sed -i '' 's|href="%PUBLIC_URL%/favicon.ico"|href="%PUBLIC_URL%/chronolist-favicon.png"|' "$PROJECT/public/index.html"

echo ">>> 4. Running fresh build & deploy..."

cd "$PROJECT"
npm install
npm run build
netlify deploy --prod --dir=build

echo ">>> ✅ CHRONOLIST is live and rebranded with full functionality."
