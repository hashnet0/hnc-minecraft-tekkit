FROM hnc-base:latest
LABEL name="hnc-minecraft-tekkit"
LABEL description="HashNet Container for Minecraft Tekkit Classic"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

# Install dependencies
RUN echo "Updating system ..." \
	&& apt-get update >/dev/null 2>&1 \
	&& echo "Installing dependencies ..." \
	&& apt-get install -y \
	bc \
	unzip \
	>/dev/null 2>&1

# Install Java 8
COPY jre-8u241-linux-x64.tar.gz /tmp/
RUN echo "Installing Java 8 ..." \
	&& mkdir -p /usr/lib/jvm/ ; \
	tar -zxf /tmp/jre-8u241-linux-x64.tar.gz --directory /usr/lib/jvm/ \
	&& rm -rf /usr/lib/jvm/jre1.8.0_241/man/ \
	&& update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jre1.8.0_241/bin/java" 1 \
	&& update-alternatives --set java /usr/lib/jvm/jre1.8.0_241/bin/java \
	&& chmod a+x /usr/bin/java

# Check java
RUN JAVA_VER=$(java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*"/\1\2/p;') ; \
	[ "$JAVA_VER" -eq 18 ] && echo "Java 8 installed!" || (echo "Java 8 failed to install!" && exit 1)

# Download Tekkit Classic Server
RUN echo "Installing Tekkit Classic Server ..." \
	&& cd /srv/ \
	&& curl -# -o tekkit.zip http://servers.technicpack.net/Technic/servers/tekkit/Tekkit_Server_3.1.2.zip \
	&& unzip -o tekkit.zip >/dev/null 2>&1 \
	&& rm -rf launch.bat launch.sh tekkit.zip

# Copy server configs
COPY server/ /srv/
RUN chmod +x /srv/*.sh

# Expose service
EXPOSE 25565

# Set image starting point
CMD ["bash", "/srv/start.sh"]
