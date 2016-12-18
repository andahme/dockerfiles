FROM andahme/openjdk:jre


EXPOSE 2181


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends zookeeper \
    && apt-get clean


VOLUME ["/var/lib/zookeeper"]


CMD ["/usr/share/zookeeper/bin/zkServer.sh", "start-foreground"]

