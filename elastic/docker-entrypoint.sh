#!/bin/bash -e

if [ ${ELASTIC_CLUSTER_NAME} ]; then
  echo "ANDAHME: Applying Configuration (cluster.name): ${ELASTIC_CLUSTER_NAME}"
  sed -i -r "s|^#?(cluster.name:\ ).*|\1${ELASTIC_CLUSTER_NAME}|" ${ELASTIC_HOME}/config/elasticsearch.yml
fi

if [ ${ELASTIC_NODE_NAME} ]; then
  echo "ANDAHME: Applying Configuration (node.name): ${ELASTIC_NODE_NAME}"
  sed -i -r "s|^#?(node.name:\ ).*|\1${ELASTIC_NODE_NAME}|" ${ELASTIC_HOME}/config/elasticsearch.yml
fi

sed -i -r \
  -e "s|^#?(network.host:\ ).*|\10\.0\.0\.0|" \
  -e "s|^#?(path.data:\ ).*|\1/data|" \
  ${ELASTIC_HOME}/config/elasticsearch.yml


exec $@

