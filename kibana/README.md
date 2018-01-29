## Quick Start

### Start Elastic
```bash
docker run -d --rm --name elastic \
  --network ${NETWORK} --network-alias elastic \
  -e ELASTIC_NETWORK_HOST=elastic \
  andahme/elastic
``

### Start Kibana
```bash
docker run -d --rm --name kibana \
  --network ${NETWORK} --network-alias kibana \
  -p 127.0.0.1:5601:5601 \
  -e KIBANA_ELASTICSEARCH_URL=http://elastic:9200 \
  -e KIBANA_SERVER_HOST=kibana \
  andahme/kibana
```


