FROM andahme/debian AS image


EXPOSE 5432


ENV LANG en_US.UTF-8

ENV PG_MAJOR 10

ENV PGHOST localhost

ENV PGDATA /var/lib/postgresql/${PG_MAJOR}/main

ENV PSQLRC /usr/share/postgresql/${PG_MAJOR}/psqlrc

ENV PATH /usr/lib/postgresql/${PG_MAJOR}/bin:${PATH}


COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends locales && \
    sed -i -r "s/# (en_US.*)/\1/g" /etc/locale.gen && \
    locale-gen

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes --no-install-recommends postgresql-common && \
    sed -i -r "s/^#?(create_main_cluster = ).*$/\1false/g" /etc/postgresql-common/createcluster.conf

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes --no-install-recommends postgresql-${PG_MAJOR} && \
    sed -i -r "s/127\.0\.0\.1\/32/0\.0\.0\.0\/0   /g" /usr/share/postgresql/${PG_MAJOR}/pg_hba.conf.sample && \
    sed -i -r -e "s/^#?(listen_addresses = ).*/\1'0.0.0.0'/g" -e "s/^#?(unix_socket_directories = )'.*'/\1''/g" /usr/share/postgresql/${PG_MAJOR}/postgresql.conf.sample && \
    mkdir -p /run/secrets && \
    chmod 777 /run/secrets

RUN echo "\set HISTFILE /dev/null" > ${PSQLRC}


VOLUME [ "/var/lib/postgresql" ]


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "postgres" ]

USER postgres

