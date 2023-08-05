FROM openjdk:11-jdk-slim

RUN mkdir -p /opt/milo-demo-server

RUN curl https://github.com/digitalpetri/opc-ua-demo-server/releases/download/v0.3/milo-demo-server-linux.zip > milo-demo-server.zip

RUN unzip /opt/milo-demo-server/milo-demo-server.zip -d /opt/milo-demo-server/

WORKDIR /opt/milo-demo-server/

CMD ["bin/milo-demo-server"]