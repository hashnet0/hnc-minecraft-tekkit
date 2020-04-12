#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Set values
TERM="xterm-256color"

# Check if the server is already running
if screen -list | grep -q "${SERVER_NAME}"; then
	echo -e "$(tput bold)$(tput setaf 1)Server is already running!$(tput sgr0)"
	exit 1
fi

# Start & Attach
./start-detatched.sh
screen -x ${SERVER_NAME}
