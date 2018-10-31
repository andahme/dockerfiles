ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_JAVA_MAJOR=11



FROM ${INPUT_DOCKER_REGISTRY}/openjdk-jre:${INPUT_JAVA_MAJOR} AS openjdk-jdk

ARG INPUT_JAVA_MAJOR


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jdk-headless

