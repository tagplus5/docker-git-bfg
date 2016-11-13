FROM alpine:3.4

RUN apk add --no-cache openjdk7-jre && \
    cd /usr/bin && \
    wget http://repo1.maven.org/maven2/com/madgag/bfg/1.12.14/bfg-1.12.14.jar && \
    mkdir /data

WORKDIR /data

ENTRYPOINT [ "java", "-jar", "/usr/bin/bfg-1.12.14.jar" ]
