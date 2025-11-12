#!/bin/bash
# Quick script to view the website from WSL

echo "🚀 Starting local server for Inscripted website..."
echo ""
echo "The website will be available at:"
echo "  http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Try Python 3 first, then Python 2
if command -v python3 &> /dev/null; then
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    python -m http.server 8000
else
    echo "Error: Python not found. Please install Python to run a local server."
    echo ""
    echo "Alternative: Install Node.js and run: npx serve"
    exit 1
fi
