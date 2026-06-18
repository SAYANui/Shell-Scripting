#!/bin/bash

# Clear the screen for a clean look
clear

echo "========================================="
echo "       QUICK SYSTEM CHECK SCRIPT         "
echo "========================================="
echo ""
# 1. Show Current User and Hostname
echo "--> Hostname: $(hostname)"
echo "--> Current User: $(whoami)"
echo "--> Date & Time: $(date)"
echo "-----------------------------------------"

# 2. Check Disk Usage
echo "--> Disk Usage (Top Partition):"
df -h / | awk 'NR==2 {print "   Total/Used/Available: " $2 " / " $3 " / " $4 " (" $5 " used)"}'
echo "-----------------------------------------"

# 3. Check Memory (RAM) Usage
echo "--> Memory Usage:"
if command -v free &> /dev/null; then
    free -h | awk '/^Mem:/ {print "   Used/Total: " $3 " / " $2}'
else
    echo "   Memory stats not available on this OS flavor."
fi
echo "-----------------------------------------"

# 4. Quick Internet Ping Check
echo "--> Testing Internet Connection..."
if ping -c 1 8.8.8.8 &> /dev/null; then
    echo "   Status: Connected to the internet!"
else
    echo "   Status: Offline or ping blocked."
fi

echo "========================================="
echo "             Check Complete!             "
echo "========================================="