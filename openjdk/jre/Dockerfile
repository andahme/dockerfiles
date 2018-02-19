ARG INPUT_JAVA_MAJOR=9



FROM andahme/debian:testing

ARG INPUT_JAVA_MAJOR


ENV JAVA_HOME /usr/lib/jvm/java-${INPUT_JAVA_MAJOR}-openjdk-amd64


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jre-headless

