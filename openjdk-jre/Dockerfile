ARG INPUT_DEBIAN_ARCH=amd64

ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_JAVA_MAJOR=11



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS openjdk-jre

ARG INPUT_JAVA_MAJOR


ENV JAVA_HOME /usr/lib/jvm/java-${INPUT_JAVA_MAJOR}-openjdk-${INPUT_DEBIAN_ARCH}


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jre-headless

