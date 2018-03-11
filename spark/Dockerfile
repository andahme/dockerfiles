ARG INPUT_JAVA_MAJOR=8

ARG INPUT_SPARK_VERSION=2.3.0

ARG INPUT_SPARK_ARTIFACT=http://apache.spinellicreations.com/spark/spark-${INPUT_SPARK_VERSION}/spark-${INPUT_SPARK_VERSION}-bin-hadoop2.7.tgz

ARG INPUT_MARIA_JDBC_VERSION=2.2.1

ARG INPUT_MARIA_JDBC_ARTIFACT=https://downloads.mariadb.com/Connectors/java/connector-java-${INPUT_MARIA_JDBC_VERSION}/mariadb-java-client-${INPUT_MARIA_JDBC_VERSION}.jar

ARG INPUT_POSTGRES_JDBC_VERSION=42.2.0

ARG INPUT_POSTGRES_JDBC_ARTIFACT=https://jdbc.postgresql.org/download/postgresql-${INPUT_POSTGRES_JDBC_VERSION}.jar



FROM andahme/debian AS distribution

ARG INPUT_SPARK_ARTIFACT

ARG INPUT_SPARK_VERSION

ARG INPUT_MARIA_JDBC_ARTIFACT

ARG INPUT_MARIA_JDBC_VERSION

ARG INPUT_POSTGRES_JDBC_ARTIFACT

ARG INPUT_POSTGRES_JDBC_VERSION


ADD ${INPUT_SPARK_ARTIFACT} /tmp/spark-${INPUT_SPARK_VERSION}.tar.gz

RUN tar -zxf /tmp/spark-${INPUT_SPARK_VERSION}.tar.gz -C /opt --strip-component=1 \
    --exclude=bin/pyspark* --exclude=python \
    --exclude=bin/sparkR* --exclude=R \
    --exclude=bin/*.cmd \
    --exclude=sbin

ADD ${INPUT_MARIA_JDBC_ARTIFACT} /opt/jars/mariadb-java-client-${INPUT_MARIA_JDBC_VERSION}.jar

ADD ${INPUT_POSTGRES_JDBC_ARTIFACT} /opt/jars/postgresql-${INPUT_POSTGRES_JDBC_VERSION}.jar

RUN mkdir /opt/logs /opt/work && \
    chmod -R 777 /opt/conf /opt/jars /opt/logs /opt/work



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS spark

ARG INPUT_SPARK_VERSION


ENV SPARK_CONF_DIR /etc/spark

ENV SPARK_HOME /opt/spark-${INPUT_SPARK_VERSION}

ENV PATH ${SPARK_HOME}/bin:${PATH}


COPY --from=distribution /opt ${SPARK_HOME}


RUN ln -s ${SPARK_HOME}/conf ${SPARK_CONF_DIR}

