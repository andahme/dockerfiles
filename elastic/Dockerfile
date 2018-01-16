ARG ELASTIC_VERSION=6.1.1

ARG ELASTIC_ARTIFACT=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTIC_VERSION}.tar.gz



FROM andahme/openjdk:jdk-8 AS distribution

ARG ELASTIC_VERSION

ARG ELASTIC_ARTIFACT



ADD ${ELASTIC_ARTIFACT} /tmp/elastic-${ELASTIC_VERSION}.tar.gz

RUN tar -zxf /tmp/elastic-${ELASTIC_VERSION}.tar.gz -C /opt --strip-component=1 \
    && chmod 777 -R /opt/config



FROM andahme/openjdk:jdk-8 AS image

ARG ELASTIC_VERSION


ENV ELASTIC_HOME /opt/elastic-${ELASTIC_VERSION}

ENV ELASTIC_PATH_DATA /data

ENV ELASTIC_PATH_LOGS /var/log/elasticsearch


ENV PATH ${ELASTIC_HOME}/bin:${PATH}


COPY --from=distribution /opt ${ELASTIC_HOME}

RUN mkdir -p ${ELASTIC_PATH_DATA} ${ELASTIC_PATH_LOGS} \
    && chmod 777 -R ${ELASTIC_PATH_DATA} ${ELASTIC_PATH_LOGS}

COPY docker-entrypoint.sh /docker-entrypoint.sh


VOLUME ${ELASTIC_PATH_DATA}

VOLUME ${ELASTIC_PATH_LOGS}


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "elasticsearch" ]


USER daemon

