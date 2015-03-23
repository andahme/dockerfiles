FROM andahme/debian


EXPOSE 6379

VOLUME ["/var/lib/redis"]

CMD ["redis-server"]


RUN adduser --system --home /var/lib/redis --no-create-home --shell /bin/bash --uid 545 --group --gecos "Redis administrator" redis

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends redis-server \
    && apt-get clean


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

