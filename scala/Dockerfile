ARG INPUT_JAVA_MAJOR=9

ARG INPUT_SCALA_VERSION=2.12.4

ARG SCALA_ARTIFACT=https://downloads.lightbend.com/scala/${INPUT_SCALA_VERSION}/scala-${INPUT_SCALA_VERSION}.tgz



FROM andahme/debian AS distribution

ARG SCALA_ARTIFACT


ADD ${SCALA_ARTIFACT} /tmp/scala.tar.gz

RUN tar -zxf /tmp/scala.tar.gz -C /opt --strip-components=1



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre as scala

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

