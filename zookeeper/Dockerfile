FROM andahme/jre


EXPOSE 2181

CMD ["/usr/share/zookeeper/bin/zkServer.sh", "start-foreground"]


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends zookeeper \
    && apt-get clean


VOLUME ["/var/lib/zookeeper"]

