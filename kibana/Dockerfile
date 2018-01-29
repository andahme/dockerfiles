ARG KIBANA_VERSION=6.1.2

ARG KIBANA_ARTIFACT=https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz



FROM andahme/openjdk:jdk-8 AS distribution

ARG KIBANA_VERSION

ARG KIBANA_ARTIFACT


ADD ${KIBANA_ARTIFACT} /tmp/kibana-${KIBANA_VERSION}.tar.gz

RUN tar -zxf /tmp/kibana-${KIBANA_VERSION}.tar.gz -C /opt --strip-component=1 && \
    chmod -R 777 /opt/config /opt/optimize



FROM andahme/debian AS image

EXPOSE 5601


ENV KIBANA_HOME /opt/kibana

ENV PATH ${KIBANA_HOME}/bin:${PATH}

ENV KIBANA_ELASTICSEARCH_URL http://elastic:9200

ENV KIBANA_SERVER_HOST kibana

ENV KIBANA_SERVER_NAME Andahme


COPY --from=distribution /opt ${KIBANA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Kibana Process User" --system --uid 511 kibana


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kibana" ]


USER kibana

