ARG INPUT_PG_MAJOR=10



FROM andahme/debian:testing AS postgres-no-volume

ARG INPUT_PG_MAJOR


EXPOSE 5432


ENV PG_MAJOR ${INPUT_PG_MAJOR}

ENV PGHOST postgres

ENV PGDATA /var/lib/postgresql/${PG_MAJOR}/main


ENV LD_LIBRARY_PATH /usr/lib/postgresql/${PG_MAJOR}/lib

ENV PATH /usr/lib/postgresql/${PG_MAJOR}/bin:${PATH}


COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends locales && \
    sed -i -r "s/^# (en_US.*)/\1/g" /etc/locale.gen && \
    locale-gen

ENV LANG en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes --no-install-recommends postgresql-common && \
    sed -i -r "s/^#?(create_main_cluster = ).*$/\1false/g" /etc/postgresql-common/createcluster.conf && \
    apt-get install --yes --no-install-recommends postgresql-${PG_MAJOR} && \
    sed -i -r "s/127\.0\.0\.1\/32/0.0.0.0\/0   /g" /usr/share/postgresql/${PG_MAJOR}/pg_hba.conf.sample && \
    sed -i -r -e "s/^#?(listen_addresses = ).*/\1'0.0.0.0'/g" -e "s/^#?(unix_socket_directories = )'.*'/\1''/g" /usr/share/postgresql/${PG_MAJOR}/postgresql.conf.sample


WORKDIR /var/lib/postgresql

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "postgres" ]

USER postgres



FROM andahme/postgres:${INPUT_PG_MAJOR}-no-volume AS postgres

VOLUME [ "/var/lib/postgresql" ]

