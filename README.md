## Quick Start

#### Create a (User Defined) Network
```bash
docker network create ${NETWORK:=andahme}
```

#### Start a (Debian) Container
**NOTE**: The `--rm` flag causes the container to be removed when the process/tty exits.
```bash
docker run -it --rm \
  --network ${NETWORK} \
  andahme/debian
```


## Contents
* Application(s) & Client(s)
    * [andahme/kafka](https://github.com/andahme/dockerfiles/blob/release/kafka/kafka/README.md)
    * NGINX
    * [andahme/postgres](https://github.com/andahme/dockerfiles/blob/release/postgres/README.md)
    * [andahme/zooKeeper](https://github.com/andahme/dockerfiles/blob/release/zookeeper/zookeeper/README.md)
* Base Image(s)
    * [andahme/build-essential](https://github.com/andahme/dockerfiles/blob/release/build-essential/build-essential/README.md)
    * [andahme/debian](https://github.com/andahme/dockerfiles/blob/release/debian/debian/README.md)
    * Hadoop
    * Spark
* Build Step(s) and Build Tool(s)
    * Checkout
    * Build
        * Maven
        * SBT
    * Publish
    * Notify
* Logging, Metrics & Monitoring
    * Elastic
    * Kibana
* Runtime(s) and REPL(s)
    * Node
    * OpenJDK
    * Python
    * [andahme/scala](https://github.com/andahme/dockerfiles/blob/release/scala/scala/README.md)
