#!/bin/bash
set -e

COMPONENT=~/todoishh/src/components/Landing/LandingHero.jsx

echo ">>> Injecting Chronolist brand message into LandingHero..."

cat <<'NEW_HERO' > "$COMPONENT"
import React from 'react';
import './LandingHero.scss';

const LandingHero = () => {
  return (
    <section className="hero">
      <h1>Organize Your Work & Life</h1>
      <p>Finally stay focused, calm, and in control.</p>
      <p><strong>Chronolist</strong> is your intelligent task manager and daily planner.</p>
      <button className="cta-button">Start for Free</button>
    </section>
  );
};

export default LandingHero;
NEW_HERO

echo ">>> ✅ UI content updated in: $COMPONENT"
