## Quick Start

### Start Elastic
```bash
docker run -d --name elastic \
  --network ${NETWORK} \
  andahme/elastic
```

### Start Kibana
```bash
docker run -d --name kibana \
  --network ${NETWORK} \
  -p 127.0.0.1:5601:5601 \
  andahme/kibana
```


