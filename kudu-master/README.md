## QuickStart
```bash
docker run -d --name kudu-master \
  --hostname kudu-master \
  --network ${NETWORK} \
  --publish 127.0.0.1:8051:8051 \
  --volume kudu-master-data:/data \
  --volume kudu-master-wal:/wal \
  andahme/kudu-master
```

