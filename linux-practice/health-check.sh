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
