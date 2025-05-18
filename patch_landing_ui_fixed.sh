#!/bin/bash
set -e

COMPONENT=~/todoishh/src/pages/landing-page/index.jsx

echo ">>> Injecting Chronolist brand message into landing-page..."

cat <<'NEW_HERO' > "$COMPONENT"
import React from 'react';
import './index.scss';

const LandingPage = () => {
  return (
    <section className="hero">
      <h1>Organize Your Work & Life</h1>
      <p>Finally stay focused, calm, and in control.</p>
      <p><strong>Chronolist</strong> is your intelligent task manager and daily planner.</p>
      <button className="cta-button">Start for Free</button>
    </section>
  );
};

export default LandingPage;
NEW_HERO

echo ">>> ✅ UI content updated in: $COMPONENT"
