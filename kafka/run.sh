#!/bin/bash


export KAFKA_SERVER_CONFIG="/opt/kafka/config/server.properties"


if [[ -n "${ZOOKEEPER_PORT_2181_TCP_ADDR}" && -n "${ZOOKEEPER_PORT_2181_TCP_PORT}" ]]; then
	echo "ZooKeeper: ${ZOOKEEPER_PORT_2181_TCP_ADDR}:${ZOOKEEPER_PORT_2181_TCP_PORT}"
else
	echo "No ZooKeeper detected..."
	exit 128
fi

if [ -e "${KAFKA_SERVER_CONFIG}" ]; then
	echo "Updating Configuration: zookeeper.connect"
	sed -i -r "s/^(zookeeper.connect=).*/\1$ZOOKEEPER_PORT_2181_TCP_ADDR:$ZOOKEEPER_PORT_2181_TCP_PORT/" /opt/kafka/config/server.properties

	if [ $# -eq 1 ]; then
		echo "Updating Configuration: broker.id"
		sed -i -r "s/^(broker.id=).*/\1$1/" /opt/kafka/config/server.properties
	fi
else
	echo "Could not locate Kafka server config file..."
	exit 128
fi


/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties

