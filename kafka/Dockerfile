FROM andahme/jre


EXPOSE 9092


CMD ["run.sh"]


ADD http://www.apache.org/dist/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz /tmp/

RUN mkdir /opt/kafka \
        && tar -zxf /tmp/kafka_2.11-0.8.2.2.tgz -C /opt/kafka --strip-component=1  \
        && rm -Rf /tmp/kafka_2.11-0.8.2.2.tgz

RUN sed -i -r "s/^(log.dirs=).*/\1\/var\/lib\/kafka/" /opt/kafka/config/server.properties


ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh


VOLUME ["/var/lib/kafka"]

