#!/bin/bash -e

KIBANA_CONFIG=${KIBANA_HOME}/config/kibana.yml

if [ ${KIBANA_SERVER_NAME} ]; then
    echo "ANDAHME: Applying Configuration (${KIBANA_CONFIG}) - (server.name): ${KIBANA_SERVER_NAME}"
    sed -i -r "s|^#?(server.name:\ ).*|\1${KIBANA_SERVER_NAME}|" ${KIBANA_CONFIG}
fi

if [ ${KIBANA_ELASTICSEARCH_URL} ]; then
    echo "ANDAHME: Applying Configuration (${KIBANA_CONFIG}) - (elasticsearch.url): ${KIBANA_ELASTICSEARCH_URL}"
    sed -i -r "s|^#?(elasticsearch.url:\ ).*|\1${KIBANA_ELASTICSEARCH_URL}|" ${KIBANA_CONFIG}
fi

echo "ANDAHME: Applying Configuration (${KIBANA_CONFIG}) - (server.host): ${KIBANA_SERVER_HOST:=$(hostname)}"
sed -i -r "s|^#?(server.host:\ ).*|\1${KIBANA_SERVER_HOST}|" ${KIBANA_CONFIG}

if [ ${KIBANA_SERVER_PORT} ]; then
    echo "ANDAHME: Applying Configuration (${KIBANA_CONFIG}) - (server.port): ${KIBANA_SERVER_PORT}"
    sed -i -r "s|^#?(server.port:\ ).*|\1${KIBANA_SERVER_PORT}|" ${KIBANA_CONFIG}
fi


exec $@

