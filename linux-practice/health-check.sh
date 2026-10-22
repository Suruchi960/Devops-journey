#!/bin/bash

set -u

echo "===== Linux Health Check ====="

echo ""
echo "--- System Uptime ---"
uptime || exit 1

echo ""
echo "--- Memory Usage ---"
free -h || exit 1

echo ""
echo "--- Disk Usage ---"
df -h / || exit 1

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if ! [[ "$DISK_USAGE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Could not determine disk usage."
    exit 1
fi

echo ""
echo "--- Disk Health Status ---"

if (( DISK_USAGE >= 80 )); then
    echo "WARNING: Disk usage is ${DISK_USAGE}%"
    exit 1
else
    echo "OK: Disk usage is ${DISK_USAGE}%"
fi

echo ""
echo "===== Health Check Complete ====="
exit 0
