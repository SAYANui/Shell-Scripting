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

# 2. Check Disk Usage (Cygwin maps the C: drive to /cygdrive/c)
echo "--> Disk Usage (Windows C: Drive):"
if [ -d "/cygdrive/c" ]; then
    df -h /cygdrive/c | awk 'NR==2 {print "   Total/Used/Available: " $2 " / " $3 " / " $4 " (" $5 " used)"}'
else
    # Fallback to root if cygdrive isn't standard
    df -h / | awk 'NR==2 {print "   Total/Used/Available: " $2 " / " $3 " / " $4 " (" $5 " used)"}'
fi
echo "-----------------------------------------"

# 3. Check Memory (RAM) Usage (Cygwin has a special /proc/meminfo)
echo "--> Memory Usage:"
if [ -f /proc/meminfo ]; then
    # Pull stats from Cygwin's virtual meminfo file and convert to GB
    total_kb=$(awk '/MemTotal:/ {print $2}' /proc/meminfo)
    free_kb=$(awk '/MemFree:/ {print $2}' /proc/meminfo)
    
    total_gb=$(echo "scale=2; $total_kb / 1024 / 1024" | bc 2>/dev/null || awk "BEGIN {print $total_kb/1024/1024}")
    free_gb=$(echo "scale=2; $free_kb / 1024 / 1024" | bc 2>/dev/null || awk "BEGIN {print $free_kb/1024/1024}")
    used_gb=$(echo "scale=2; $total_gb - $free_gb" | bc 2>/dev/null || awk "BEGIN {print $total_gb-$free_gb}")
    
    # Format to 2 decimal places manually if bc isn't handling it pretty
    printf "   Used/Total: %.2f GB / %.2f GB\n" "$used_gb" "$total_gb"
else
    echo "   Memory stats not available in this environment."
fi
echo "-----------------------------------------"

# 4. Quick Internet Ping Check
echo "--> Testing Internet Connection..."
# -n 1 is used because Windows/Cygwin ping sometimes prefers -n over -c, 
# but Cygwin's native ping handles -c 1. We add a 2-second timeout (-W 2).
if ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    echo "   Status: Connected to the internet!"
else
    echo "   Status: Offline or ping blocked."
fi

echo "========================================="
echo "             Check Complete!             "
echo "========================================="