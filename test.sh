#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker run --rm -i -t \
	-e CONTAINER_NAME=${CONTAINER_NAME} \
	-e MEMORY_MAX=${MEMORY_MAX} \
	-e MEMORY_INIT=${MEMORY_INIT} \
	--memory=${MEMORY_MAX} \
	--memory-swap=${MEMORY_MAX} \
	--memory-swappiness="0" \
	-p ${PORT}:25565 \
	${IMAGE_NAME} bash

