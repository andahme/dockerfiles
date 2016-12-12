FROM andahme/debian


ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends openjdk-8-jre-headless

