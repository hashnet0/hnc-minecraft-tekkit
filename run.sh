#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Settings
MAX_MEMORY="4096m"
PORT="25598"

docker run -d --memory=${MAX_MEMORY} --name hnc-minecraft-tekkit -p ${PORT}:25565 hnc-minecraft-tekkit:latest
