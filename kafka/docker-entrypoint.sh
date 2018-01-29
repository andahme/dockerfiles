#!/bin/bash -e

sed -i \
  -e "s/^\\(broker.id=\\).*/\1${BROKER_ID}/g" \
  -e "s/^\\(zookeeper.connect=\\).*/\1${ZOOKEEPER_CONNECT}/g" \
  ${KAFKA_HOME}/config/server.properties


exec $@

