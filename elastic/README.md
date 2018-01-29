## Quick Start

### Elastic Server
docker run -d --name elastic \
    --network ${NETWORK} --network-alias elastic \
    -e ELASTIC_NETWORK_HOST=elastic \
    andahme/elastic

