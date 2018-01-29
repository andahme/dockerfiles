#!/bin/bash -e

if [ -f /var/lib/zookeeper/myid ]; then
    echo "ANDAHME Detected - ZOOKEEPER__MYID ($(cat /var/lib/zookeeper/myid))"
else
    echo "ANDAHME Initializing - ZOOKEEPER__MYID (${ZOOKEEPER__MYID})"
    echo ${ZOOKEEPER__MYID} > /var/lib/zookeeper/myid
fi

if [ $(env | grep ZOOKEEPER_SERVER_ | wc -l) -gt 0 ]; then
    env | grep ZOOKEEPER_SERVER_ | sed "s/ZOOKEEPER_SERVER_\\([0-9]*\\)/server\.\1/g" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
fi


exec $@

