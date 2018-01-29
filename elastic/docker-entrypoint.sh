#!/bin/bash -e

echo "ANDAHME: Applying Configuration (cluster.name): ${ELASTIC_CLUSTER_NAME}"
echo "ANDAHME: Applying Configuration (network.host): ${ELASTIC_NETWORK_HOST}"
echo "ANDAHME: Applying Configuration (node.name): ${ELASTIC_NODE_NAME}"

sed -i -r \
  -e "s|^#?(cluster.name:\ ).*|\1${ELASTIC_CLUSTER_NAME}|" \
  -e "s|^#?(network.host:\ ).*|\1${ELASTIC_NETWORK_HOST}|" \
  -e "s|^#?(node.name:\ ).*|\1${ELASTIC_NODE_NAME}|" \
  -e "s|^#?(path.data:\ ).*|\1/data|" \
  ${ELASTIC_HOME}/config/elasticsearch.yml


exec $@

