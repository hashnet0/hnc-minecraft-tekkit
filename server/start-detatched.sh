#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Set values
TERM="xterm-256color"
JAR="Tekkit.jar"

# Check if the server is already running
if screen -list | grep -q "${SERVER_NAME}"; then
	echo -e "$(tput bold)$(tput setaf 1)This server is already running!$(tput sgr0)"
	exit 1
fi

# Cleanup
rm dimensional-anchors.log* >/dev/null 2>&1
rm ForgeModLoader-0.log* >/dev/null 2>&1
rm server.log.* >/dev/null 2>&1

# Execute
screen -S ${SERVER_NAME} -dmS java -server -Djava.awt.headless=true -XX:ParallelGCThreads=2 -XX:+UseAdaptiveGCBoundary -XX:MaxGCPauseMillis=50 -XX:+CMSIncrementalPacing -XX:+AggressiveOpts -Xms${SERVER_INIT_MEMORY} -Xmx${SERVER_MAX_MEMORY} -jar $DIR/$JAR nogui

# Notify of launch
echo -e "$(tput bold)$(tput setaf 2)>>> Server started from $DIR/$JAR, do 'screen -x $SERVER_NAME' to access the minecraft server console.$(tput sgr0)" 1>&2
