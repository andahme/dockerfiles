ARG INPUT_JAVA_MAJOR=8

ARG INPUT_HADOOP_VERSION=3.0.0

ARG HADOOP_ARTIFACT=http://apache.spinellicreations.com/hadoop/common/hadoop-${INPUT_HADOOP_VERSION}/hadoop-${INPUT_HADOOP_VERSION}.tar.gz



FROM andahme/debian AS distribution

ARG HADOOP_ARTIFACT


ADD ${HADOOP_ARTIFACT} /tmp/hadoop.tar.gz

RUN tar -zxf /tmp/hadoop.tar.gz -C /opt --strip-component=1 \
    --exclude=share/doc

RUN mv /opt/etc/hadoop /etc/hadoop && \
    chmod -R 777 /etc/hadoop



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS hadoop

ARG INPUT_HADOOP_VERSION


ENV HADOOP_CONF_DIR /etc/hadoop


ENV HADOOP_HOME /opt/hadoop-${INPUT_HADOOP_VERSION}

ENV LD_LIBRARY_PATH ${HADOOP_HOME}/lib/native:${LD_LIBRARY_PATH}

ENV PATH ${HADOOP_HOME}/bin:${PATH}


COPY --from=distribution /etc/hadoop ${HADOOP_CONF_DIR}

COPY --from=distribution /opt ${HADOOP_HOME}


RUN mkdir /var/log/hadoop && \
    chmod 777 /var/log/hadoop && \
    ln -s ${HADOOP_CONF_DIR} ${HADOOP_HOME}/etc/hadoop && \
    ln -s /var/log/hadoop ${HADOOP_HOME}/logs

