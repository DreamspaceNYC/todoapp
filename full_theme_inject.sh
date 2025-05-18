#!/bin/bash
set -e

echo ">>> Moving into project folder..."
cd ~/todoishh

echo ">>> Creating theme folder..."
mkdir -p ./src/theme

echo ">>> Writing tailwind.config.js..."
cat <<EOF > tailwind.config.js
module.exports = {
  content: ['./src/**/*.{js,jsx,ts,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: {
          core: '#7F1DFF',
          accent: '#00F0B5',
          glow: '#F7FF00',
          dark: '#0F0C29',
          soft: '#E0E0E0',
          error: '#FF1E56',
          success: '#32FF6A',
        }
      },
      fontFamily: {
        headline: ['Bebas Neue', 'sans-serif'],
        body: ['Inter', 'sans-serif'],
        stamp: ['Saira Stencil One', 'cursive'],
      },
      backgroundImage: {
        'hero-gradient': 'linear-gradient(to right, #7F1DFF, #00F0B5)',
      },
      animation: {
        pulseGlow: 'pulse 3s ease-in-out infinite',
      }
    },
  },
  plugins: [],
}
EOF

echo ">>> Writing theme CSS..."
cat <<EOF > ./src/theme/chronolist.css
:root {
  --color-core: #7F1DFF;
  --color-accent: #00F0B5;
  --color-glow: #F7FF00;
  --color-dark: #0F0C29;
  --color-soft: #E0E0E0;
  --color-error: #FF1E56;
  --color-success: #32FF6A;
}

body {
  background-color: var(--color-dark);
  color: var(--color-soft);
  font-family: 'Inter', sans-serif;
}
EOF

echo ">>> Writing animated logo CSS..."
cat <<EOF > ./src/theme/logo-animate.css
@keyframes pulseGlow {
  0% {
    transform: scale(1);
    filter: drop-shadow(0 0 0px var(--color-accent));
  }
  50% {
    transform: scale(1.1);
    filter: drop-shadow(0 0 10px var(--color-glow));
  }
  100% {
    transform: scale(1);
    filter: drop-shadow(0 0 0px var(--color-accent));
  }
}

.logo-animated {
  animation: pulseGlow 2.5s infinite ease-in-out;
}
EOF

echo ">>> Writing darkmode.js logic..."
cat <<EOF > ./src/theme/darkmode.js
export function enableDarkMode() {
  document.documentElement.classList.add('dark');
}
export function disableDarkMode() {
  document.documentElement.classList.remove('dark');
}
export function toggleDarkMode() {
  document.documentElement.classList.toggle('dark');
}
EOF

echo ">>> Injecting CSS imports in App.js..."
IMPORTS="import './theme/chronolist.css';\nimport './theme/logo-animate.css';"
grep -qxF "$IMPORTS" ./src/App.js || echo -e "$IMPORTS" >> ./src/App.js

echo ">>> Building Chronolist with full brand insanity..."
npm run build

echo ">>> Deploying to Netlify..."
netlify deploy --prod --dir=build

echo ">>> ✅ Chronolist themed, animated, and deployed:"
echo "https://todoapp-dreamspace.netlify.app" | pbcopy
echo "URL copied to clipboard."
