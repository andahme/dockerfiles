ARG INPUT_ZOOKEEPER_VERSION=3.4.11

ARG INPUT_ZOOKEEPER_ARTIFACT=http://apache.mirrors.tds.net/zookeeper/zookeeper-${INPUT_ZOOKEEPER_VERSION}/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz



FROM andahme/debian AS distribution

ARG INPUT_ZOOKEEPER_ARTIFACT

ARG INPUT_ZOOKEEPER_VERSION


ADD ${INPUT_ZOOKEEPER_ARTIFACT} /tmp/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz

RUN tar -zxf /tmp/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz -C /opt --strip-component=1 \
    --exclude=contrib \
    --exclude=docs \
    --exclude=dist-maven \
    --exclude=src

RUN chmod 777 /opt/conf



FROM andahme/openjdk:jre-8 AS image

ARG INPUT_ZOOKEEPER_VERSION


EXPOSE 2181


ENV ZOOKEEPER_HOME /opt/zookeeper

ENV ZOOKEEPER__MYID 1

ENV PATH ${ZOOKEEPER_HOME}/bin:${PATH}


COPY --from=distribution /opt ${ZOOKEEPER_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN mkdir /var/lib/zookeeper && \
    chmod 777 /var/lib/zookeeper && \
    sed "s/^\\(dataDir=\\).*/\1\/var\/lib\/zookeeper/g" ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg > ${ZOOKEEPER_HOME}/conf/zoo.cfg

RUN useradd --comment "ZooKeeper User" --create-home --uid 1011 zookeeper


VOLUME /var/lib/zookeeper


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "zkServer.sh", "start-foreground" ]


USER zookeeper

