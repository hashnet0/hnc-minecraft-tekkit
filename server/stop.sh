#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Set values
TERM="xterm-256color"

# Check if the server is already running
if ! screen -list | grep -q "${SERVER_NAME}"; then
	echo -e "$(tput bold)$(tput setaf 1)This server is not running!$(tput sgr0)"
	exit 1
fi

# Execute shutdown
echo -e "Broadcasting shutdown ..."
screen -S ${SERVER_NAME} -p 0 -X stuff "say Shutting down in 10 seconds ...^M"
sleep 10
screen -S ${SERVER_NAME} -p 0 -X stuff "stop^M"
