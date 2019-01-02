ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_INFLUX_VERSION=1.7.2



FROM ${INPUT_DOCKER_REGISTRY}/openjdk-jre:8 AS influxdb


EXPOSE 8086


ADD https://dl.influxdata.com/influxdb/releases/influxdb_1.7.2_amd64.deb /tmp/influxdb_1.7.2_amd64.deb

RUN  dpkg -i /tmp/influxdb_1.7.2_amd64.deb


VOLUME [ "/var/lib/influxdb/data" ]


#WORKDIR /var/lib/postgresql

#ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "influxd" ]

#USER postgres

