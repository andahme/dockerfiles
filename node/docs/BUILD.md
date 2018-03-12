## Base Image(s)

#### Build `no-volume` image
```bash
docker build \
  --target no-volume \
  --tag andahme/node:no-volume \
  --squash \
  node/.
```

#### Build `standard` image
```bash
docker build \
  --target node \
  --tag andahme/node \
  node/.
```

