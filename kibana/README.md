## Quick Start

### Elastic Server
docker run -d --rm --name ${NETWORK}-elastic \
    --network ${NETWORK} --network-alias elastic \
    -e ELASTIC_NETWORK_HOST=elastic \
    andahme/elastic


### Start Kibana Server
docker run -d --rm --name ${NETWORK}-kibana \
    --network ${NETWORK} --network-alias kibana \
    -p 0.0.0.0:5601:5601 \
    -e KIBANA_ELASTICSEARCH_URL=http://elastic:9200 \
    -e KIBANA_SERVER_HOST=kibana \
    andahme/kibana

