ARG INPUT_JAVA_MAJOR=8

ARG INPUT_ELASTIC_VERSION=6.2.3

ARG ELASTIC_ARTIFACT=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${INPUT_ELASTIC_VERSION}.tar.gz



FROM andahme/debian AS distribution

ARG ELASTIC_ARTIFACT


ADD ${ELASTIC_ARTIFACT} /tmp/elastic.tar.gz

RUN tar -zxf /tmp/elastic.tar.gz -C /opt --strip-component=1

RUN mkdir -p /opt/logs && \
    chmod -R 777 /opt/config /opt/logs



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS elastic

ARG INPUT_ELASTIC_VERSION


EXPOSE 9200

EXPOSE 9300


ENV ELASTIC_HOME /opt/elastic-${INPUT_ELASTIC_VERSION}

ENV PATH ${ELASTIC_HOME}/bin:${PATH}


COPY --from=distribution /opt ${ELASTIC_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Elastic Process User" --system --uid 511 elastic

COPY log4j2.properties ${ELASTIC_HOME}/config/log4j2.properties

RUN mkdir -p /data && \
    chmod 777 /data


VOLUME /data


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "elasticsearch" ]

USER elastic

