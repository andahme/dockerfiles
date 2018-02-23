#!/bin/bash -e

if [ ${KIBANA_SERVER_NAME} ]; then
  echo "ANDAHME: Applying Configuration (server.name): ${KIBANA_SERVER_NAME}"
  sed -i -r "s|^#?(server.name:\ ).*|\1${KIBANA_SERVER_NAME}|" ${KIBANA_HOME}/config/kibana.yml
fi

echo "ANDAHME: Applying Configuration (elasticsearch.url): ${KIBANA_ELASTICSEARCH_URL:=http://elastic:9200}"
sed -i -r \
  -e "s|^#?(elasticsearch.url:\ ).*|\1${KIBANA_ELASTICSEARCH_URL}|" \
  -e "s|^#?(server.host:\ ).*|\10\.0\.0\.0|" \
  ${KIBANA_HOME}/config/kibana.yml


exec $@

