#!/bin/bash

# Check if the script is executed with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

# Find the process ID using port $1
pid=$(lsof -t -i :$1)

if [ -z "$pid" ]; then
    echo "No process found using port $1."
else
    echo "Killing process with PID $pid..."
    kill $pid
fi
