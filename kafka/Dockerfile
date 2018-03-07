ARG INPUT_JAVA_MAJOR=8

ARG INPUT_KAFKA_VERSION=1.0.1

ARG INPUT_SCALA_VERSION=2.11

ARG KAFKA_ARTIFACT=http://apache.osuosl.org/kafka/${INPUT_KAFKA_VERSION}/kafka_${INPUT_SCALA_VERSION}-${INPUT_KAFKA_VERSION}.tgz



FROM andahme/debian AS distribution

ARG KAFKA_ARTIFACT


ADD ${KAFKA_ARTIFACT} /tmp/kafka.tar.gz

RUN tar -zxf /tmp/kafka.tar.gz -C /opt --strip-component=1 \
    --exclude=site-docs

RUN mkdir /opt/logs && \
    chmod 777 /opt/config /opt/logs



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS kafka

ARG INPUT_KAFKA_VERSION


EXPOSE 9092


ENV KAFKA_HOME /opt/kafka

ENV PATH ${KAFKA_HOME}/bin:${PATH}


COPY --from=distribution /opt ${KAFKA_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Kafka User" --create-home --uid 1011 kafka

RUN sed -i "s/^\\(log.dirs=\\).*/\1\/var\/lib\/kafka/g" ${KAFKA_HOME}/config/server.properties

COPY log4j.properties ${KAFKA_HOME}/config/log4j.properties

RUN mkdir /var/lib/kafka && \
    chmod 777 /var/lib/kafka


VOLUME /var/lib/kafka


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kafka-server-start.sh", "/opt/kafka/config/server.properties" ]

USER kafka

