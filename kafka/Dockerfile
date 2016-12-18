FROM andahme/openjdk:jre


EXPOSE 9092


ENV KAFKA_HOME /opt/kafka

ENV LOG_DIR /var/log/kafka

ENV KAFKA_VERSION 0.10.1.0

ENV SCALA_VERSION 2.11

ENV SCALA_BINARY_VERSION 2.11

ENV PATH ${PATH}:${KAFKA_HOME}/bin


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install --yes --force-yes --no-install-recommends curl \
    && curl http://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -o /tmp/kafka.tar.gz \
    && apt-get autoremove --yes --force-yes curl \
    && mkdir -p /opt/kafka /var/lib/kafka ${LOG_DIR} \
    && chown daemon /var/lib/kafka ${LOG_DIR} \
    && tar -zxf /tmp/kafka.tar.gz -C ${KAFKA_HOME} --strip-component=1  \
    && rm -Rf /tmp/kafka.tar.gz \
    && sed -i -r "s/^(log.dirs=).*/\1\/var\/lib\/kafka/" /opt/kafka/config/server.properties



ADD docker-entrypoint.sh /


VOLUME [ "/var/lib/kafka" ]

VOLUME [ "${LOG_DIR}" ]


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "kafka-server-start.sh" ]


USER daemon

