#!/bin/bash

# Fail on the first failing command, so a broken install cannot be masked by a
# passing command further down.
set -e

if [ "$1" == "run" ]; then
  cd frontend
  npm install
  npm run dev
fi

if [ "$1" == "build" ]; then
  cd frontend
  npm install
  npm run build
fi

if [ "$1" == "preview" ]; then
  cd frontend
  npm install
  npm run build
  npm run preview
fi

if [ "$1" == "help" ] || [ -z "$1" ]; then
  echo "Available commands:"
  echo "  run      - Install dependencies and start the local Astro dev server"
  echo "  build    - Install dependencies and build the frontend"
  echo "  preview  - Build and serve the production output locally"
  echo "  help     - Show this help message"
fi
