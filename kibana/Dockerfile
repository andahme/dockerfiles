ARG KIBANA_VERSION=6.1.1

ARG KIBANA_ARTIFACT=https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz



FROM andahme/openjdk:jdk-8 AS distribution

ARG KIBANA_VERSION

ARG KIBANA_ARTIFACT


ADD ${KIBANA_ARTIFACT} /tmp/kibana-${KIBANA_VERSION}.tar.gz

RUN tar -zxf /tmp/kibana-${KIBANA_VERSION}.tar.gz -C /opt --strip-component=1 \
    && chmod 777 -R /opt/config



FROM andahme/openjdk:jdk-8 AS image

ARG KIBANA_VERSION


ENV KIBANA_HOME /opt/kibana-${KIBANA_VERSION}

ENV PATH ${KIBANA_HOME}/bin:${PATH}


COPY --from=distribution --chown=daemon:users /opt ${KIBANA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kibana" ]


USER daemon


