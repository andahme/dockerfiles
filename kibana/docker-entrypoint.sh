#!/bin/bash -e

echo "ANDAHME: Applying Configuration (elasticsearch.url): ${KIBANA_ELASTICSEARCH_URL}"
echo "ANDAHME: Applying Configuration (server.host): ${KIBANA_SERVER_NAME}"
echo "ANDAHME: Applying Configuration (server.name): ${KIBANA_SERVER_NAME}"

sed -i -r \
  -e "s|^#?(elasticsearch.url:\ ).*|\1${KIBANA_ELASTICSEARCH_URL}|" \
  -e "s|^#?(server.host:\ ).*|\1${KIBANA_SERVER_HOST}|" \
  -e "s|^#?(server.name:\ ).*|\1${KIBANA_SERVER_NAME}|" \
  ${KIBANA_HOME}/config/kibana.yml


exec $@

