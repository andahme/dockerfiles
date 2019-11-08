#!/bin/bash -e

ORDINAL_TEST='^[0-9]+$'

if [ -f /var/lib/zookeeper/myid ]; then
    echo "ANDAHME Detected - ZOOKEEPER_MYID ($(cat /var/lib/zookeeper/myid))"
elif [ ${ZOOKEEPER_MYID} ]; then
    echo "ANDAHME Initializing - ZOOKEEPER_MYID (${ZOOKEEPER_MYID})"
    echo "${ZOOKEEPER_MYID}" > /var/lib/zookeeper/myid
elif [[ ${HOSTNAME##*-} =~ ${ORDINAL_TEST} ]]; then
    echo "ANDAHME Initializing - ZOOKEEPER_MYID (${HOSTNAME##*-})"
    echo "${HOSTNAME##*-}" > /var/lib/zookeeper/myid

    if [ ${ZOOKEEPER_REPLICAS:-1} -gt 1 ]; then
        echo "ANDAHME Initializing - ZOOKEEPER_REPLICAS (${ZOOKEEPER_REPLICAS})"
        for ORDINAL in $(seq 0 $((${ZOOKEEPER_REPLICAS} - 1))); do
            if [ ${ORDINAL} == ${HOSTNAME##*-} ]; then
                echo "server.${ORDINAL}=0.0.0.0:2888:3888" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
            else
                echo "server.${ORDINAL}=${HOSTNAME%-*}-${ORDINAL}.${HOSTNAME%-*}:2888:3888" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
            fi
        done
    fi
else
    echo "ANDAHME Initializing - ZOOKEEPER_MYID (1)"
    echo 1 > /var/lib/zookeeper/myid
fi


exec $@

