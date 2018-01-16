## Quick Start

### Elastic Server
docker run -d --rm --name ${NETWORK}-elastic \
    --network ${NETWORK} --network-alias elastic \
    -e ELASTIC_NETWORK_HOST=elastic \
    andahme/elastic

