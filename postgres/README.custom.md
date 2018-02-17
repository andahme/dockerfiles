# Create a custom Postgres image

## Start an 'andahme/postgres:no-volume' container
```bash
docker run -it --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume ${PWD}/docker-init-sql:/docker-init-sql \
  -e INITDB_BOOTSTRAP_PASSWORD="not2345" \
  andahme/postgres:no-volume
```

## Stop container and commit changes
```bash
docker stop postgers && \
  docker commit postgres andahme/application-db:no-volume
```

## Cleanup
```bash
docker rm postgres
```


# Next Steps..

## A. Run the image (and explicitly declare a data volume)
```bash
docker run -d --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume application-db:/var/lib/postgresql \
  andahme/application-db:no-volume
```

## B. Extend the image (to auto-create a data-volume at startup)
```dockerfile
FROM andahme/application-base

VOLUME [ "/var/lib/postgresql" ]
```

