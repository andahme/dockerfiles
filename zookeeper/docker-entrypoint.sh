#!/bin/bash -e

if [ -f /var/lib/zookeeper/myid ]; then
    echo "DATA DIRECTORY ID: $(cat /var/lib/zookeeper/myid)"
else
    echo ${ZOOKEEPER_MY_ID} > /var/lib/zookeeper/myid
fi


# Single Server
echo clientPort=${ZOOKEEPER_CLIENT_PORT:-2181} > ${ZOOKEEPER_HOME}/conf/zoo.cfg
echo dataDir=/var/lib/zookeeper >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
echo tickTime=${ZOOKEEPER_TICK_TIME:-2000} >> ${ZOOKEEPER_HOME}/conf/zoo.cfg

# Clustered Setup
if [ $(env | grep ZOOKEEPER_SERVER_ | wc -l) -gt 0 ]; then
    echo initLimit=${ZOOKEEPER_INIT_LIMIT:-5} >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
    echo syncLimit=${ZOOKEEPER_SYNC_LIMIT:-2} >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
    env | grep ZOOKEEPER_SERVER_ | sed "s/ZOOKEEPER_SERVER_\\([0-9]*\\)/server\.\1/g" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
fi


exec $@

