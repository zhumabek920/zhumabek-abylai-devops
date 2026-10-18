#!/bin/bash
# System information script for Zhumabek Abylai (IT2-2306, ID 38304)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Zhumabek_Abylai_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Abylai"
echo "Surname: Zhumabek"
echo "Group: IT2-2306"
echo "Student ID: 38304"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s) $(uname -r) ($(uname -m))"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h 2>/dev/null || echo "free command not available"
echo "=============================="

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
