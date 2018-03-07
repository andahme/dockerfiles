## QuickStart

### ZooKeeper Server
```bash
docker run -d --name zookeeper \
  --network ${NETWORK} --network-alias zookeeper \
  andahme/zookeeper
```

### ZooKeeper Client
```bash
docker run -it --rm \
  --network ${NETWORK} \
  andahme/zookeeper zkCli.sh -server zookeeper:2181
```


