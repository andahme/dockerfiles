FROM andahme/debian


EXPOSE 5432

VOLUME ["/var/lib/postgresql"]

CMD ["run.sh"]


RUN adduser --system --home /var/lib/postgresql --no-create-home --shell /bin/bash --uid 747 --group --gecos "PostgreSQL administrator" postgres

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends postgresql-common \
    && apt-get clean \
    && sed -i -r "s/^#(data_directory = '\/var\/lib\/postgresql)\/.*('.*)$/\1\2/g" /etc/postgresql-common/createcluster.conf \
    && sed -i -r "s/^(stats_temp_directory =.*)$/#\1/g" /etc/postgresql-common/createcluster.conf

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes --no-install-recommends postgresql-9.4 \
    && apt-get clean \
    && sed -i -r "s/^#(listen_addresses = ')[0-9A-Za-z\.]*('.*)$/\1\*\2/g" /etc/postgresql/9.4/main/postgresql.conf \
    && echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.4/main/pg_hba.conf \
    && cp -Rf /var/lib/postgresql /var/lib/postgres-template


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

