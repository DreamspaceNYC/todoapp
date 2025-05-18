#!/bin/bash
set -e

echo ">>> Rebranding all 'chronolist' references to 'chronolist'..."
cd ~/todoishh

# Replace all cases of chronolist
grep -rl 'chronolist' ./ | xargs sed -i '' 's/chronolist/chronolist/g'
grep -rl 'Chronolist' ./ | xargs sed -i '' 's/Chronolist/Chronolist/g'
grep -rl 'CHRONOLIST' ./ | xargs sed -i '' 's/CHRONOLIST/CHRONOLIST/g'

echo ">>> Building updated Chronolist app..."
npm run build

echo ">>> Deploying to Netlify..."
netlify deploy --prod --dir=build

echo ">>> 🔥 Rebrand complete. Live at:"
echo "https://todoapp-dreamspace.netlify.app" | pbcopy
echo "URL copied to clipboard: https://todoapp-dreamspace.netlify.app"
