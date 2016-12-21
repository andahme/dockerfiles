FROM andahme/openjdk:jre


EXPOSE 7000

EXPOSE 9042


ENV HEAP_NEWSIZE 800M

ENV MAX_HEAP_SIZE 2G


RUN DEBIAN_FRONTEND=noninteractive \
    echo deb http://www.apache.org/dist/cassandra/debian 39x main > /etc/apt/sources.list.d/cassandra.list \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends cassandra


VOLUME [ "/var/lib/cassandra" ]


CMD [ "cassandra", "-f" ]


USER cassandra


