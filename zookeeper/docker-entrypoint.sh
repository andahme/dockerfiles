#!/bin/bash -e

if [ -f /var/lib/zookeeper/myid ]; then
    echo "ANDAHME Detected - ZOOKEEPER_MYID ($(cat /var/lib/zookeeper/myid))"
else
    echo "ANDAHME Initializing - ZOOKEEPER_MYID (${ZOOKEEPER_MYID})"
    echo ${ZOOKEEPER_MYID} > /var/lib/zookeeper/myid
fi

if [ $(env | grep ZOOKEEPER_SERVER_ | wc -l) -gt 0 ]; then
    env | grep ZOOKEEPER_SERVER_ | sed "s/ZOOKEEPER_SERVER_\\([0-9]*\\)/server\.\1/g" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
fi


exec $@

