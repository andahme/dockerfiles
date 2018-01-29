# QuickStart: Server

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


# QuickStart: Client

#### Client Shell
```bash
docker run -it --rm \
  --network ${NETWORK} \
  -e KAFKA_BROKER_LIST=kafka:9092 \
  -e KAFKA_SERVER=kafka:9092 \
  andahme/kafka /bin/bash
```

## Client Operations

#### List Topics
```bash
kafka-topics.sh --zookeeper ${KAFKA__ZOOKEEPER_CONNECT} \
  --list
```

#### Create a Topic
```bash
kafka-topics.sh --zookeeper ${KAFKA__ZOOKEEPER_CONNECT} \
  --create \
  --partitions 1 \
  --replication-factor 1 \
  --topic my_topic
```

#### Start a Console Consumer
```bash
kafka-console-consumer.sh --bootstrap-server ${KAFKA_SERVER} \
  --topic my_topic
```

#### Start a Console Producer
```bash
kafka-console-producer.sh --broker-list ${KAFKA_BROKER_LIST} \
  --topic my_topic
```

