ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_JAVA_MAJOR=8

ARG INPUT_SCALA_VERSION=2.12.7

ARG SCALA_ARTIFACT=https://downloads.lightbend.com/scala/${INPUT_SCALA_VERSION}/scala-${INPUT_SCALA_VERSION}.tgz



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS distribution

ARG SCALA_ARTIFACT


ADD ${SCALA_ARTIFACT} /tmp/scala.tar.gz

RUN tar -zxf /tmp/scala.tar.gz -C /opt --strip-components=1



FROM ${INPUT_DOCKER_REGISTRY}/openjdk-jre:${INPUT_JAVA_MAJOR} AS scala

ARG INPUT_SCALA_VERSION


ENV SCALA_HOME /opt/scala-${INPUT_SCALA_VERSION}

ENV PATH ${SCALA_HOME}/bin:${PATH}


COPY --from=distribution /opt ${SCALA_HOME}


RUN useradd --comment "Scala User" --create-home --uid 1011 scala

RUN mkdir /workspace && \
    chmod 777 /workspace


WORKDIR /workspace

CMD [ "scala" ]

USER scala

