## QuickStart
```bash
docker run -d --name kudu-tserver \
  --hostname kudu-tserver \
  --network ${NETWORK} \
  --publish 127.0.0.1:8050:8050 \
  --volume kudu-tserver-data:/data \
  --volume kudu-tserver-wal:/wal \
  andahme/kudu-tserver
```
  
  