## Base Image(s)

```bash
export INPUT_NODE_VERSION=11.0.0
```


#### Build `no-volume` image
```bash
docker build \
  --build-arg INPUT_NODE_VERSION=${INPUT_NODE_VERSION} \
  --target no-volume \
  --tag andahme/node:${INPUT_NODE_VERSION}-no-volume \
  --squash \
  node/.
```

#### Build `standard` image
```bash
docker build \
  --build-arg INPUT_NODE_VERSION=${INPUT_NODE_VERSION} \
  --target node \
  --tag andahme/node:${INPUT_NODE_VERSION} \
  node/.
```

