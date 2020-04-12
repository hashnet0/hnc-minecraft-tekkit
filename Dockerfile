FROM hnc-base:latest
LABEL name="hnc-minecraft-tekkit"
LABEL description="HashNet Container for Minecraft Tekkit Classic"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

# Set environment variables
ENV SERVER_NAME hnc-minecraft-tekkit
ENV SERVER_MAX_MEMORY 4096m
ENV SERVER_INIT_MEMORY 4096m

# Install dependencies
RUN apt-get update >/dev/null 2>&1 \
	&& apt-get install -y \
	screen \
	bc \
	>/dev/null 2>&1

# Install Java 8
COPY jre-8u241-linux-x64.tar.gz /tmp/
RUN mkdir -p /usr/lib/jvm/ ; \
	tar -zxf /tmp/jre-8u241-linux-x64.tar.gz --directory /usr/lib/jvm/ \
	&& rm -rf /usr/lib/jvm/jre1.8.0_241/man/ \
	&& update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jre1.8.0_241/bin/java" 1 \
	&& update-alternatives --set java /usr/lib/jvm/jre1.8.0_241/bin/java \
	&& chmod a+x /usr/bin/java

# Check java
RUN JAVA_VER=$(java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*"/\1\2/p;') ; \
	[ "$JAVA_VER" -ge 18 ] && echo "Java installed!" || (echo "Java failed to install!" && exit 1)

# Download Tekkit Classic Server
RUN cd /root \
	&& curl -s -o tekkit.zip http://servers.technicpack.net/Technic/servers/tekkit/Tekkit_Server_3.1.2.zip \
	&& cd /root unzip -o tekkit.zip \
	&& rm -rf launch.bat launch.sh tekkit.zip

# Copy server configs
COPY server/ /root/
RUN chmod +x /root/*.sh

# Expose service
EXPOSE 25565

# Execute start
CMD ["/root/start.sh"]
