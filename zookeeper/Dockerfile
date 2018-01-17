ARG INPUT_ZOOKEEPER_VERSION=3.4.11

ARG INPUT_ZOOKEEPER_ARTIFACT=http://apache.mirrors.tds.net/zookeeper/zookeeper-${INPUT_ZOOKEEPER_VERSION}/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz



# TARGET: DISTRIBUTION
FROM andahme/debian AS distribution

ARG INPUT_ZOOKEEPER_ARTIFACT

ARG INPUT_ZOOKEEPER_VERSION


ADD ${INPUT_ZOOKEEPER_ARTIFACT} /tmp/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz

RUN tar -zxf /tmp/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz -C /opt --strip-component=1 && \
    chmod 777 /opt/conf



# TARGET: IMAGE
FROM andahme/openjdk:jre-8 AS image

ARG INPUT_ZOOKEEPER_VERSION


ENV ZOOKEEPER_HOME /opt/zookeeper-${INPUT_ZOOKEEPER_VERSION}

ENV PATH ${ZOOKEEPER_HOME}/bin:${PATH}


ENV ZOOKEEPER_MY_ID 0


COPY --from=distribution /opt ${ZOOKEEPER_HOME}

RUN mkdir /var/lib/zookeeper \
    && chown daemon /var/lib/zookeeper

COPY docker-entrypoint.sh /docker-entrypoint.sh


VOLUME /var/lib/zookeeper


WORKDIR ${ZOOKEEPER_HOME}

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "zkServer.sh", "start-foreground" ]


USER daemon


