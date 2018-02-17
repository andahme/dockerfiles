ARG ELASTIC_VERSION=6.2.1

ARG ELASTIC_ARTIFACT=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTIC_VERSION}.tar.gz



FROM andahme/debian AS distribution

ARG ELASTIC_VERSION

ARG ELASTIC_ARTIFACT


ADD ${ELASTIC_ARTIFACT} /tmp/elastic-${ELASTIC_VERSION}.tar.gz

RUN tar -zxf /tmp/elastic-${ELASTIC_VERSION}.tar.gz -C /opt --strip-component=1

COPY log4j2.properties /opt/config/log4j2.properties

RUN mkdir -p /opt/logs && \
    chmod -R 777 /opt/config /opt/logs



FROM andahme/openjdk:8-jre AS elastic

EXPOSE 9200

EXPOSE 9300


ENV ELASTIC_CLUSTER_NAME Andahme

ENV ELASTIC_NETWORK_HOST elastic

ENV ELASTIC_NODE_NAME elastic

ENV ELASTIC_HOME /opt/elastic

ENV PATH ${ELASTIC_HOME}/bin:${PATH}


COPY --from=distribution /opt ${ELASTIC_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir -p /data && \
    chmod 777 /data

RUN useradd --comment "Elastic Process User" --system --uid 511 elastic


VOLUME /data


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "elasticsearch" ]

USER elastic

