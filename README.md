# HashNet Container for Minecraft Tekkit Classic

This Docker image generates fully packaged Minecraft Tekkit Classic containers for production use.

The following dependencies will automatically be built in the container:

- Java 8 (JRE 8)
- Tekkit Classic server archive

### 1. Configure image

Configure the Minecraft Tekkit Classic server settings in the `server/` directory, these files will replace the files within the official server archive, useful for config files and plugins. You should also look at `settings.sh` for container configuration.

### 2. Build the image

Run the `build.sh` file to generate the Docker image specified in `settings.sh`.

### 2. Deploy the container

To spawn a temporary container run `test.sh`. The server contents is located in `/srv/`.

To spawn a persistent container execute `run.sh` which will utilize the configuration settings in `settings.sh`.

