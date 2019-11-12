#!/bin/bash -e


if [ -f /var/lib/zookeeper/myid ]; then
    if [ ${ZOOKEEPER_MYID} ]; then
        if [ $(cat /var/lib/zookeeper/myid) != ${ZOOKEEPER_MYID} ]; then
            echo "ANDAHME ERROR - myid does not match"
            exit 1
        fi
    else
        ZOOKEEPER_MYID=$(cat /var/lib/zookeeper/myid)
        echo "ANDAHME Loading Configuration - ZOOKEEPER_MYID (${ZOOKEEPER_MYID})"
    fi
elif [ ${ZOOKEEPER_MYID} ]; then
    echo "ANDAHME Applying Configuration - ZOOKEEPER_MYID (${ZOOKEEPER_MYID})"
    echo "${ZOOKEEPER_MYID}" > /var/lib/zookeeper/myid
elif [[ ${HOSTNAME##*-} =~ '^[0-9]+$' && ${HOSTNAME%-*} == $(hostname -f | cut -d'.' -f2) ]]; then
    ZOOKEEPER_MYID=${HOSTNAME##*-}
    echo "ANDAHME Applying Configuration - ZOOKEEPER_MYID (${ZOOKEEPER_MYID})"
    echo "${ZOOKEEPER_MYID}" > /var/lib/zookeeper/myid
else
    echo "ANDAHME Applying Configuration - ZOOKEEPER_MYID (${ZOOKEEPER_MYID:=1})"
    echo "${ZOOKEEPER_MYID}" > /var/lib/zookeeper/myid
fi

cat ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg > ${ZOOKEEPER_HOME}/conf/zoo.cfg
if [[ ${ZOOKEEPER_REPLICAS} && ${ZOOKEEPER_REPLICAS} > 1 ]]; then
    for INDEX in $( seq 0 $(( ${ZOOKEEPER_REPLICAS} - 1 )) ); do
        if [ ${INDEX} == ${ZOOKEEPER_MYID} ]; then
            echo "ANDAHME Applying Configuration - server.${INDEX} (0.0.0.0:2888:3888)"
            echo "server.${INDEX}=0.0.0.0:2888:3888" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
        else
            echo "ANDAHME Applying Configuration - server.${INDEX} (${HOSTNAME%-*}-$((${INDEX})).$(hostname -f | cut -d'.' -f2-):2888:3888)"
            echo "server.${INDEX}=${HOSTNAME%-*}-$((${INDEX})).$(hostname -f | cut -d'.' -f2-):2888:3888" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
        fi
    done
fi


exec $@

