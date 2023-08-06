#!/bin/bash

# Check if the script is executed with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

# Check if the port number is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: sudo ./kill_port.sh <port_number>"
    exit 1
fi

# Get the port number from the first argument
port=$1

# Find and kill the process using the specified port
pkill -9 -f ":$port"

if [ $? -eq 0 ]; then
    echo "Process using port $port has been successfully terminated."
else
    echo "No process found using port $port."
fi
