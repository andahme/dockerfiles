# Build 'no-volume' image
```bash
docker build \
  --target postgres-no-volume \
  --tag andahme/postgres:${INPUT_PG_MAJOR:=10}-no-volume \
  --squash \
  postgres/.
```

# Build 'standard' image
```bash
docker build \
  --target postgres \
  --tag andahme/postgres:${INPUT_PG_MAJOR:=10} \
  --build-arg INPUT_PG_MAJOR=${INPUT_PG_MAJOR} \
  postgres/.
```

