ARG INPUT_KIBANA_VERSION=6.2.3

ARG KIBANA_ARTIFACT=https://artifacts.elastic.co/downloads/kibana/kibana-${INPUT_KIBANA_VERSION}-linux-x86_64.tar.gz



FROM andahme/debian:base AS distribution

ARG KIBANA_ARTIFACT


ADD ${KIBANA_ARTIFACT} /tmp/kibana.tar.gz

RUN tar -zxf /tmp/kibana.tar.gz -C /opt --strip-component=1 && \
    chmod -R 777 /opt/config /opt/data /opt/optimize



FROM andahme/debian:base AS kibana

ARG INPUT_KIBANA_VERSION


EXPOSE 5601


ENV KIBANA_HOME /opt/kibana-${INPUT_KIBANA_VERSION}

ENV PATH ${KIBANA_HOME}/bin:${PATH}


COPY --from=distribution /opt ${KIBANA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Kibana Process User" --system --uid 511 kibana


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kibana" ]

USER kibana

