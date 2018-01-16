#!/bin/bash -e

ELASTIC_CONFIG=${ELASTIC_HOME}/config/elasticsearch.yml


if [ ${ELASTIC_CLUSTER_NAME} ]; then
    echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (cluster.name): ${ELASTIC_CLUSTER_NAME}"
    sed -i -r "s|^#?(cluster.name:\ ).*|\1${ELASTIC_CLUSTER_NAME}|" ${ELASTIC_CONFIG}
fi

if [ ${ELASTIC_NODE_NAME} ]; then
    echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (node.name): ${ELASTIC_NODE_NAME}"
    sed -i -r "s|^#?(node.name:\ ).*|\1${ELASTIC_NODE_NAME}|" ${ELASTIC_CONFIG}
fi

echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (path.data): ${ELASTIC_PATH_DATA}"
sed -i -r "s|^#?(path.data:\ ).*|\1${ELASTIC_PATH_DATA}|" ${ELASTIC_CONFIG}

echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (path.logs): ${ELASTIC_PATH_LOGS}"
sed -i -r "s|^#?(path.logs:\ ).*|\1${ELASTIC_PATH_LOGS}|" ${ELASTIC_CONFIG}

echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (network.host): ${ELASTIC_NETWORK_HOST:=$(hostname)}}"
sed -i -r "s|^#?(network.host:\ ).*|\1${ELASTIC_NETWORK_HOST}|" ${ELASTIC_CONFIG}

if [ ${ELASTIC_HTTP_PORT} ]; then
    echo "ANDAHME: Applying Configuration (${ELASTIC_CONFIG}) - (http.port): ${ELASTIC_HTTP_PORT}"
    sed -i -r "s|^#?(http.port:\ ).*|\1${ELASTIC_HTTP_PORT}|" ${ELASTIC_CONFIG}
fi


exec $@

