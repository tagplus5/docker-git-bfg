FROM alpine:latest

RUN apk add --no-cache openjdk8-jre && \
    cd /usr/bin && \
    wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar && \
    mkdir /data

WORKDIR /data

ENTRYPOINT [ "java", "-jar", "/usr/bin/bfg-1.14.0.jar" ]
