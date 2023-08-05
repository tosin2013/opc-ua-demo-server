FROM openjdk:8-jdk-slim

RUN mkdir -p /opt/milo-demo-server

WORKDIR /opt/

# Install curl and unzip
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/digitalpetri/opc-ua-demo-server/releases/download/v0.3/milo-demo-server-linux.zip -o /opt/milo-demo-server.zip && \
    unzip milo-demo-server.zip -d /opt/  && \
    rm /opt/milo-demo-server.zip

RUN ls -R .

# Change the owner of the directory
RUN chown 1001:0 /opt 

# Optionally, change the permissions of the directory
RUN chmod g+w /opt && \
    mkdir -p /.local/share/milodemoserver/security && \
    mkdir -p /.local/share/milodemoserver/security/pki/trusted && \
    chmod g+w /.local/share/milodemoserver/security && \
    chmod g+w  /.local/share/milodemoserver/security/pki/trusted


CMD ["/opt/milo-demo-server/bin/milo-demo-server"]
