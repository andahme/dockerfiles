## Quick Start

### Start a Zookeeper Server
```bash
docker run -d --name ${ZK_CONTAINER} \
	andahme/zookeeper
```

### Start a Kafka Server (Data Volume Container)
**NOTE**: Add port mapping (`-p 9092:9092`) to expose on host interface(s).  
**NOTE**: Docker *data volumes* will be created for `/var/lib/kafka` and `/var/log/kafka`.  
**NOTE**: When a link alias (`ZK`) is present, the --override zookeeper.connect' parameter will be supplied to `kafka-server-start`.  
```bash
docker run -it --link ${ZK_CONTAINER}:ZK \
	andahme/kafka
```
