## QuickStart


### Start ZooKeeper (Standalone)

docker run -d --name ${NETWORK}-zookeeper \
    --network ${NETWORK} --network-alias zookeeper \
    andahme/zookeeper


### Start ZooKeeper (High-Availability)

#### aang.lab.andah.me
docker run -d --name zookeeper \
    --network host --hostname aang \
    -e ZOOKEEPER_SERVER_0=aang.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_1=hippie.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_2=vash.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_MY_ID=0 \
    andahme/zookeeper haServer

#### hippie.lab.andah.me
docker run -d --name zookeeper \
    --network host --hostname hippie \
    -e ZOOKEEPER_SERVER_0=aang.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_1=hippie.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_2=vash.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_MY_ID=1 \
    andahme/zookeeper haServer

#### vash.lab.andah.me
docker run -d --name zookeeper \
    --network host --hostname vash \
    -e ZOOKEEPER_SERVER_0=aang.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_1=hippie.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_SERVER_2=vash.lab.andah.me:2888:3888 \
    -e ZOOKEEPER_MY_ID=2 \
    andahme/zookeeper haServer



### CONNECT
docker exec -it \
    ${NETWORK}-zookeeper \
    bin/zkCli.sh -server zookeeper:2181



## MAINTENANCE
$ export ZOOKEEPER_CLASSPATH="zookeeper.jar:lib/slf4j-api-1.7.5.jar:lib/slf4j-log4j12-1.7.5.jar:lib/log4j-1.2.17.jar:conf"
$ java -cp ${ZOOKEEPER_CLASSPATH} org.apache.zookeeper.server.PurgeTxnLog <dataDir> <snapDir> -n <count>


