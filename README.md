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
    * Kafka
    * NGINX
    * [andahme/postgres](https://github.com/andahme/dockerfiles/blob/release/postgres/README.md)
    * ZooKeeper
* Base Image(s)
    * Build-Essential
    * Debian
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
    * Scala
