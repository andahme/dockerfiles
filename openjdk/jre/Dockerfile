ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_JAVA_MAJOR=11



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing

ARG INPUT_JAVA_MAJOR


ENV JAVA_HOME /usr/lib/jvm/java-${INPUT_JAVA_MAJOR}-openjdk-amd64


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jre-headless

