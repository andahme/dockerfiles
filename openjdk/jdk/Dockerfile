ARG INPUT_JAVA_MAJOR=9



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre

ARG INPUT_JAVA_MAJOR


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jdk-headless

