## Quick Start

#### Start ZooKeeper
```bash
docker run -d --name zookeeper \
  --network ${NETWORK} --network-alias zookeeper \
  andahme/zookeeper
```

#### Start Kafka
```bash
docker run -d --name kafka \
  --network ${NETWORK} --network-alias kafka \
  andahme/kafka
```

## Quick Start: Client
```bash
docker run -it --rm \
  --network ${NETWORK} \
  -e KAFKA_BROKER_LIST=kafka:9092 \
  -e KAFKA_SERVER=kafka:9092 \
  -e ZOOKEEPER_CONNECT=zookeeper:2181 \
  andahme/kafka bash
```

