ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:jessie AS kudu-master


EXPOSE 7050

EXPOSE 8050


RUN apt-get update && \
    apt-get install --yes \
      apt-transport-https \
      curl \
      gnupg2

RUN curl http://archive.cloudera.com/kudu/debian/jessie/amd64/kudu/archive.key | apt-key add -

RUN echo deb http://archive.cloudera.com/kudu/debian/jessie/amd64/kudu jessie-kudu5 contrib > /etc/apt/sources.list.d/kudu.list

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
      kudu-tserver


VOLUME /data

VOLUME /wal


CMD [ "kudu-tserver", "-fs_data_dirs=/data", "-fs_wal_dir=/wal", "-logtostderr=true", "--use_hybrid_clock=false", "-tserver_master_addrs=kudu-master:7051" ]


