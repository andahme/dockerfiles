## Client Cheat Sheet

#### List Topics
```bash
kafka-topics.sh --zookeeper ${ZOOKEEPER_CONNECT} \
  --list
```

#### Create a Topic
```bash
kafka-topics.sh --zookeeper ${ZOOKEEPER_CONNECT} \
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

