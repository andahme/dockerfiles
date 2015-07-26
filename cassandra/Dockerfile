FROM andahme/jre


EXPOSE 7199 7000 7001 9160 9042

VOLUME ["/var/lib/cassandra"]

CMD ["run.sh"]


RUN adduser --system --home /var/lib/cassandra --no-create-home --shell /bin/bash --uid 444 --group --gecos "Cassandra administrator" cassandra

RUN echo "deb http://www.apache.org/dist/cassandra/debian 22x main" > /etc/apt/sources.list.d/cassandra.list \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends cassandra \
    && apt-get clean 


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

