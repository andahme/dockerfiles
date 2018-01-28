#!/bin/bash -e


sed -i -r \
  -e "s/^(broker.id=).*/\1${KAFKA_SERVER__BROKER_ID}/" \
  -e "s/^(zookeeper.connect=).*/\1${KAFKA_SERVER__ZOOKEEPER_CONNECT}/" \
  -e "s|^(log.dirs=).*|\1${KAFKA_SERVER__LOG_DIRS}|" \
  ${KAFKA_HOME}/config/server.properties


exec $@

