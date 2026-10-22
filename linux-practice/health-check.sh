#!/bin/bash

echo "===== Linux Health Check ====="

echo ""
echo "--- System Uptime ---"
uptime

echo ""
echo "--- Memory Usage ---"
free -h

echo ""
echo "--- Disk Usage ---"
df -h /

echo ""
echo "===== Health Check Complete ====="

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo ""
echo "--- Disk Health Status ---"

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is ${DISK_USAGE}%"
else
    echo "OK: Disk usage is ${DISK_USAGE}%"
fi

