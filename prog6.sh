#!/bin/bash

# Clear the screen for a clean look
clear

# Get the current logged-in user
USER_NAME=$(whoami)

echo "=================================================="
echo " Hello, $USER_NAME! Welcome back."
echo "=================================================="
echo ""

# Display Current Date and Time
echo "📅 CURRENT DATE & TIME:"
echo "-----------------------"
date "+%A, %B %d, %Y | %I:%M %p"
echo ""

# Display Weather using wttr.in
# (format=3 gives a clean, single-line weather summary)
echo "🌤️ CURRENT WEATHER:"
echo "-------------------"
if command -v curl &> /dev/null; then
    # You can replace ?format=3 with your city, e.g., "wttr.in/London?format=3"
    curl -s "wttr.in?format=3" || echo "Format error or wttr.in is temporarily down."
else
    echo "Error: 'curl' is not installed in Cygwin. Cannot fetch weather."
fi

echo ""
echo "=================================================="