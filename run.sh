#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker run -d -i -t \
	-e CONTAINER_NAME=${CONTAINER_NAME} \
	-e MEMORY_MAX=${MEMORY_MAX} \
	-e MEMORY_INIT=${MEMORY_INIT} \
	--memory=${MEMORY_MAX} \
	--memory-swap=${MEMORY_MAX} \
	--memory-swappiness=0 \
	--name ${CONTAINER_NAME} \
	--mount "type=volume,src=${VOLUME_NAME},dst=/srv,volume-driver=local" \
	-p ${PORT}:25565 \
	${IMAGE_NAME}

