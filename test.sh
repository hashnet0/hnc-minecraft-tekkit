#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

docker run --rm -i -t --memory="4096m" -p 25565:25565 hnc-minecraft-tekkit:latest bash
