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

## k8s: Client

#### Start Client
```bash
kubectl run \
  -it --rm --restart Never \
  --image registry.local.andah.me/kafka:local \
  --env KAFKA_BOOTSTRAP_SERVER=kafka:9092 \
  kafka-client -- bash
```

#### List Topics
```bash
kafka-topics.sh --bootstrap-server ${KAFKA_BOOTSTRAP_SERVER} \
  --list
```

#### Create Topic
```bash
kafka-topics.sh --bootstrap-server ${KAFKA_BOOTSTRAP_SERVER} \
  --create --topic <TOPIC> \
  --partitions 1 \
  --replication-factor 1
```

#### Console Consumer
```bash
kafka-topics.sh --bootstrap-server ${KAFKA_BOOTSTRAP_SERVER} \
  --list
```

#### Console Producer
```bash
kafka-topics.sh --bootstrap-server ${KAFKA_BOOTSTRAP_SERVER} \
  --list
```

