#!/bin/bash -e

sed -i \
  -e "s/^\\(broker.id=\\).*/\1${KAFKA__BROKER_ID}/g" \
  -e "s/^\\(zookeeper.connect=\\).*/\1${KAFKA__ZOOKEEPER_CONNECT}/g" \
  ${KAFKA_HOME}/config/server.properties


exec $@

