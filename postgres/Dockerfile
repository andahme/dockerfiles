FROM andahme/debian


EXPOSE 5432


ENV PG_MAJOR 10

ENV PGDATA /var/lib/postgresql/${PG_MAJOR}/main

ENV PSQLRC /usr/share/postgresql/${PG_MAJOR}/psqlrc


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install --yes --no-install-recommends postgresql-common \
    && sed -i -r "s/^#?(create_main_cluster = ).*$/\1false/g" /etc/postgresql-common/createcluster.conf \
    && sed -i -r "s/^(stats_temp_directory =.*)$/#\1/g" /etc/postgresql-common/createcluster.conf \
    && apt-get install --yes --no-install-recommends postgresql-${PG_MAJOR} \
    && sed -i -r "s/^#?(listen_addresses = ).*/\1'*'/g" /usr/share/postgresql/${PG_MAJOR}/postgresql.conf.sample \
    && sed -i -r "s/127\.0\.0\.1\/32/0\.0\.0\.0\/0   /g" /usr/share/postgresql/${PG_MAJOR}/pg_hba.conf.sample \
    && echo "\set HISTFILE /dev/null" > ${PSQLRC} \
    && echo 2345 > /tmp/pg_password \
    && pg_createcluster ${PG_MAJOR} main -- --pwfile=/tmp/pg_password \
    && rm /tmp/pg_password \
    && sed -i -r "s/^#?(initdb_options = ).*$/\1'--pwprompt'/g" /etc/postgresql-common/createcluster.conf


ADD docker-entrypoint.sh /


VOLUME [ "/etc/postgresql" ]

VOLUME [ "/var/lib/postgresql" ]


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "postgres" ]


USER postgres

