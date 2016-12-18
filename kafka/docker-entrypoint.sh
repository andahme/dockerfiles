#!/bin/bash

COMMAND=$1; shift
case ${COMMAND} in
    kafka-server-start.sh)
        if [ "${ZK_PORT_2181_TCP_ADDR}" -a "${ZK_PORT_2181_TCP_PORT}" ]; then
            exec kafka-server-start.sh ${KAFKA_HOME}/config/server.properties --override zookeeper.connect=${ZK_PORT_2181_TCP_ADDR}:${ZK_PORT_2181_TCP_PORT} $@
        elif [ "${ZOOKEEPER_CONNECT}" ]; then
            exec kafka-server-start.sh ${KAFKA_HOME}/config/server.properties --override zookeeper.connect=${ZOOKEEPER_CONNECT} $@
        else
            exec kafka-server-start.sh ${KAFKA_HOME}/config/server.properties $@
        fi
        ;;
    *)
        exec ${COMMAND} $@
        ;;
esac

