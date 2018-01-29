## Quick Start

### Elastic Server
docker run -d --name elastic \
    --network ${NETWORK} --network-alias elastic \
    andahme/elastic

