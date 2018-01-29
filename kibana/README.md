## Quick Start

### Start Elastic
```bash
docker run -d --name elastic \
  --network ${NETWORK} --network-alias elastic \
  andahme/elastic
```

### Start Kibana
```bash
docker run -d --name kibana \
  --network ${NETWORK} --network-alias kibana \
  -p 127.0.0.1:5601:5601 \
  andahme/kibana
```


