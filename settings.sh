#!/bin/bash

# Docker image name
IMAGE_NAME="hnc-minecraft-tekkit:latest"

# The container's name when using ./run.sh
CONTAINER_NAME="hnc-minecraft-tekkit"

# The maximum memory allowed in this container
MEMORY_MAX="4096m"

# The initial memory allocated to the server
MEMORY_INIT="4096m"

# The Docker's external port
PORT="25598"

# The mounted volume name when using ./run.sh
VOLUME_NAME=${CONTAINER_NAME}

