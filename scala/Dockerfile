ARG SCALA_VERSION=2.12.4

ARG SCALA_ARTIFACT=https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz



FROM andahme/debian AS distribution

ARG SCALA_ARTIFACT

ARG SCALA_VERSION


ADD ${SCALA_ARTIFACT} /tmp/scala-${SCALA_VERSION}.tar.gz

RUN tar -zxf /tmp/scala-${SCALA_VERSION}.tar.gz -C /opt --strip-components=1



FROM andahme/openjdk:8-jre as scala

ARG SCALA_VERSION


ENV SCALA_HOME /opt/scala-${SCALA_VERSION}

ENV PATH ${SCALA_HOME}/bin:${PATH}


COPY --from=distribution /opt ${SCALA_HOME}

RUN useradd --comment "Scala User" --create-home --uid 1011 scala

RUN mkdir /workspace && \
    chmod 777 /workspace


WORKDIR /workspace

CMD [ "scala" ]

USER scala

