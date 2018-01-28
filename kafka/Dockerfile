ARG INPUT_KAFKA_VERSION=1.0.0

ARG INPUT_SCALA_VERSION=2.11

ARG INPUT_KAFKA_ARTIFACT=http://apache.osuosl.org/kafka/${INPUT_KAFKA_VERSION}/kafka_${INPUT_SCALA_VERSION}-${INPUT_KAFKA_VERSION}.tgz



FROM andahme/debian AS distribution

ARG INPUT_KAFKA_ARTIFACT

ARG INPUT_KAFKA_VERSION


ADD ${INPUT_KAFKA_ARTIFACT} /tmp/kafka-${INPUT_KAFKA_VERSION}.tar.gz

RUN tar -zxf /tmp/kafka-${INPUT_KAFKA_VERSION}.tar.gz -C /opt --strip-component=1 && \
    mkdir /opt/logs && \
    chmod 777 /opt/config /opt/logs

COPY log4j.properties /opt/config/log4j.properties



FROM andahme/openjdk:jre-8 AS image

ARG INPUT_KAFKA_VERSION


ENV KAFKA_HOME /opt/kafka

ENV KAFKA_SERVER__BROKER_ID 0

ENV KAFKA_SERVER__LOG_DIRS /var/lib/kafka

ENV KAFKA_SERVER__ZOOKEEPER_CONNECT zookeeper:2181

ENV PATH ${KAFKA_HOME}/bin:${PATH}


COPY --from=distribution /opt ${KAFKA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Kafka User" --create-home --uid 1011 kafka && \
    mkdir ${KAFKA_SERVER__LOG_DIRS} && \
    chmod 777 ${KAFKA_SERVER__LOG_DIRS}


VOLUME ${KAFKA_SERVER__LOG_DIRS}


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kafka-server-start.sh", "/opt/kafka/config/server.properties" ]


USER kafka

