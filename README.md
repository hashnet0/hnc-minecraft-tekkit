# HashNet Container for Minecraft Tekkit Classic

This Docker image generates fully packaged Minecraft Tekkit Classic containers for production use.

The following dependencies will automatically be built in the container:

- Java 8 (JRE 8)
- Tekkit Classic server archive

### 1. Configure image

Configure the Minecraft Tekkit Classic server settings in the `server/` directory, these files will replace the files within the official server archive, useful for config files and plugins.

### 2. Build the image

Run the `build.sh` file to generate the Docker image `hnc-minecraft-tekkit`.

### 2. Deploy the container

To spawn a temporary container run `test.sh`. The server contents is located in `/root/`.

You can start the temporary container's server by executing `./start.sh` in `/root/` and the server will automatically generate any missing configuration files and should be accessible on port 25565.

To spawn a dedicated container you should configure the `run.sh` script to use
the proper port to port-forward and volume mounting. By default the container
will mount to `/srv/minecraft/tekkit_classic/`.

