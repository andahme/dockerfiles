ARG INPUT_JAVA_MAJOR=8

ARG INPUT_SPARK_VERSION=2.3.0

ARG SPARK_ARTIFACT=http://apache.spinellicreations.com/spark/spark-${INPUT_SPARK_VERSION}/spark-${INPUT_SPARK_VERSION}-bin-hadoop2.7.tgz



FROM andahme/debian:testing AS distribution

ARG SPARK_ARTIFACT

ARG INPUT_SPARK_VERSION


ADD ${SPARK_ARTIFACT} /tmp/spark-${INPUT_SPARK_VERSION}.tar.gz

RUN tar -zxf /tmp/spark-${INPUT_SPARK_VERSION}.tar.gz -C /opt --strip-component=1 \
    --exclude=bin/pyspark* --exclude=python \
    --exclude=bin/sparkR* --exclude=R \
    --exclude=bin/*.cmd \
    --exclude=sbin

RUN mkdir /opt/logs /opt/work && \
    chmod -R 777 /opt/conf /opt/logs /opt/work



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS spark

ARG INPUT_SPARK_VERSION


ENV SPARK_CONF_DIR /etc/spark


ENV SPARK_HOME /opt/spark-${INPUT_SPARK_VERSION}

ENV PATH ${SPARK_HOME}/bin:${PATH}


COPY --from=distribution /opt ${SPARK_HOME}


RUN ln -s ${SPARK_HOME}/conf ${SPARK_CONF_DIR}

