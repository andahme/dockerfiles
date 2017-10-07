FROM andahme/debian


ENV JAVA_HOME /usr/lib/jvm/java-9-openjdk-amd64/jre


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install --yes --no-install-recommends openjdk-9-jre-headless

