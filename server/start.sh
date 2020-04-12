#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
export TERM="xterm-256color"
JAR="Tekkit.jar"

# Cleanup before launch
rm -f dimensional-anchors.log* >/dev/null 2>&1
rm -f ForgeModLoader-0.log* >/dev/null 2>&1
rm -f server.log.* >/dev/null 2>&1

# Execute
exec java -server -Djava.awt.headless=true -XX:ParallelGCThreads=2 -XX:+UseAdaptiveGCBoundary -XX:MaxGCPauseMillis=50 -XX:+CMSIncrementalPacing -XX:+AggressiveOpts -Xms${MEMORY_INIT} -Xmx${MEMORY_MAX} -jar ${DIR}/${JAR} nogui
