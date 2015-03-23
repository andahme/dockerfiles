FROM andahme/debian


EXPOSE 27017 28017

VOLUME ["/var/lib/mongodb"]

CMD ["run.sh"]


RUN adduser --system --home /var/lib/mongodb --no-create-home --shell /bin/bash --uid 646 --group --gecos "MongoDB administrator" mongodb

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends mongodb \
    && apt-get clean


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

