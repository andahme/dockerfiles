FROM andahme/debian


ENV PG_MAJOR 9.6

EXPOSE 5432


VOLUME ["/etc/postgresql"]

VOLUME ["/var/lib/postgresql"]


ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends postgresql-common \
    && sed -i -r "s/^#?(create_main_cluster = ).*$/\1false/g" /etc/postgresql-common/createcluster.conf \
    && sed -i -r "s/^(stats_temp_directory =.*)$/#\1/g" /etc/postgresql-common/createcluster.conf \
    && apt-get install -y --force-yes --no-install-recommends postgresql-${PG_MAJOR} \
    && apt-get clean


USER postgres

