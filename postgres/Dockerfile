FROM andahme/debian


EXPOSE 5432

VOLUME ["/etc/postgresql"]
VOLUME ["/var/lib/postgresql"]

CMD ["run.sh"]


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends postgresql-common \
    && sed -i -r "s/^#?(create_main_cluster = ).*$/\1false/g" /etc/postgresql-common/createcluster.conf \
    && sed -i -r "s/^(stats_temp_directory =.*)$/#\1/g" /etc/postgresql-common/createcluster.conf \
    && apt-get install -y --force-yes --no-install-recommends postgresql-9.5 \
    && apt-get clean

ENV PGDATA /var/lib/postgresql/9.5/main


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

USER postgres

