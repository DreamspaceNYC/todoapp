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
