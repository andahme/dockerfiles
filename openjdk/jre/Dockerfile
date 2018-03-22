ARG INPUT_JAVA_MAJOR=10



FROM andahme/debian:testing

ARG INPUT_JAVA_MAJOR


ENV _JAVA_OPTIONS "-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"


ENV JAVA_HOME /usr/lib/jvm/java-${INPUT_JAVA_MAJOR}-openjdk-amd64


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-${INPUT_JAVA_MAJOR}-jre-headless

