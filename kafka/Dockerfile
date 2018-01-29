ARG INPUT_KAFKA_VERSION=1.0.0

ARG INPUT_SCALA_VERSION=2.11

ARG INPUT_KAFKA_ARTIFACT=http://apache.osuosl.org/kafka/${INPUT_KAFKA_VERSION}/kafka_${INPUT_SCALA_VERSION}-${INPUT_KAFKA_VERSION}.tgz



FROM andahme/debian AS distribution

ARG INPUT_KAFKA_ARTIFACT

ARG INPUT_KAFKA_VERSION


ADD ${INPUT_KAFKA_ARTIFACT} /tmp/kafka-${INPUT_KAFKA_VERSION}.tar.gz

RUN tar -zxf /tmp/kafka-${INPUT_KAFKA_VERSION}.tar.gz -C /opt --strip-component=1 \
    --exclude=site-docs

COPY log4j.properties /opt/config/log4j.properties

RUN mkdir /opt/logs && \
    chmod 777 /opt/config /opt/logs



FROM andahme/openjdk:jre-8 AS image

ARG INPUT_KAFKA_VERSION


EXPOSE 9092


ENV KAFKA_HOME /opt/kafka

ENV PATH ${KAFKA_HOME}/bin:${PATH}

ENV BROKER_ID 0

ENV ZOOKEEPER_CONNECT zookeeper:2181


COPY --from=distribution /opt ${KAFKA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN mkdir /var/lib/kafka && \
    chmod 777 /var/lib/kafka && \
    sed -i "s/^\\(log.dirs=\\).*/\1\/var\/lib\/kafka/g" ${KAFKA_HOME}/config/server.properties

RUN useradd --comment "Kafka User" --create-home --uid 1011 kafka


VOLUME /var/lib/kafka


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kafka-server-start.sh", "/opt/kafka/config/server.properties" ]


USER kafka

