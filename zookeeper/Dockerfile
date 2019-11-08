ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_JAVA_MAJOR=8

ARG INPUT_ZOOKEEPER_VERSION=3.5.6


ARG ZOOKEEPER_ARTIFACT=http://apache.mirrors.tds.net/zookeeper/zookeeper-${INPUT_ZOOKEEPER_VERSION}/zookeeper-${INPUT_ZOOKEEPER_VERSION}.tar.gz



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS distribution

ARG ZOOKEEPER_ARTIFACT


ADD ${ZOOKEEPER_ARTIFACT} /tmp/zookeeper.tar.gz

RUN tar -zxf /tmp/zookeeper.tar.gz -C /opt --strip-component=1 \
    --exclude=contrib \
    --exclude=docs \
    --exclude=dist-maven \
    --exclude=src



FROM ${INPUT_DOCKER_REGISTRY}/openjdk-jre:${INPUT_JAVA_MAJOR}-base AS zookeeper

ARG INPUT_ZOOKEEPER_VERSION


EXPOSE 2181


ENV ZOOKEEPER_HOME /opt/zookeeper-${INPUT_ZOOKEEPER_VERSION}

ENV PATH ${ZOOKEEPER_HOME}/bin:${PATH}


COPY --from=distribution /opt ${ZOOKEEPER_HOME}

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "ZooKeeper User" --create-home --uid 1011 zookeeper

RUN sed \
      -e "s/^\\(dataDir=\\).*/\1\/var\/lib\/zookeeper/g" \
      -e "s/^\\(initLimit=\\).*/\130/g" \
      ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg \
      > ${ZOOKEEPER_HOME}/conf/zoo.cfg

RUN mkdir /var/lib/zookeeper && \
    chown zookeeper ${ZOOKEEPER_HOME}/conf/zoo.cfg /var/lib/zookeeper


VOLUME /var/lib/zookeeper


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "zkServer.sh", "start-foreground" ]

USER zookeeper

