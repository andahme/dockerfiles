ARG INPUT_HADOOP_VERSION=2.9.0

ARG INPUT_HADOOP_ARTIFACT=http://apache.spinellicreations.com/hadoop/common/hadoop-${INPUT_HADOOP_VERSION}/hadoop-${INPUT_HADOOP_VERSION}.tar.gz


# TARGET: DISTRIBUTION
FROM andahme/debian AS distribution

ARG INPUT_HADOOP_ARTIFACT

ARG INPUT_HADOOP_VERSION


ADD ${INPUT_HADOOP_ARTIFACT} /tmp/hadoop-${INPUT_HADOOP_VERSION}.tar.gz

RUN tar -zxf /tmp/hadoop-${INPUT_HADOOP_VERSION}.tar.gz -C /opt --strip-component=1 && \
    mv /opt/etc/hadoop /etc/hadoop && \
    chmod -R 777 /etc/hadoop



# TARGET: IMAGE
FROM andahme/openjdk:jre-8 AS hadoop

ARG INPUT_HADOOP_VERSION


ENV HADOOP_CONF_DIR /etc/hadoop

ENV HADOOP_HOME /opt/hadoop-${INPUT_HADOOP_VERSION}

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${HADOOP_HOME}/lib/native

ENV PATH ${HADOOP_HOME}/bin:${PATH}


COPY --from=distribution /opt ${HADOOP_HOME}

COPY --from=distribution /etc/hadoop ${HADOOP_CONF_DIR}


RUN mkdir /var/log/hadoop && \
    chmod 777 /var/log/hadoop && \
    ln -s ${HADOOP_CONF_DIR} ${HADOOP_HOME}/etc/hadoop && \
    ln -s /var/log/hadoop ${HADOOP_HOME}/logs


VOLUME /tmp

