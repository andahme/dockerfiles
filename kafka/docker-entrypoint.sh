#!/bin/bash -e

sed -i \
  -e "s/^\\(broker.id=\\).*/\1${BROKER_ID:-1}/g" \
  -e "s/^\\(zookeeper.connect=\\).*/\1${ZOOKEEPER_CONNECT:-zookeeper:2181}/g" \
  ${KAFKA_HOME}/config/server.properties


exec $@

