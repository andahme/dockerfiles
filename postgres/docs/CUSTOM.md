# Create a custom Postgres image
NOTE: Build custom tag (no-volume) by removing VOLUME line from postgres/Dockerfile

## Start an 'andahme/postgres:no-volume' container
```bash
docker run -it --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume ${PWD}/docker-init-sql:/sql \
  -e INITDB_BOOTSTRAP_USERNAME=CUSTOM_USER \
  andahme/postgres:no-volume
```

docker run -it --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume ${PWD}/docker-init-sql:/docker-init-sql \
  -e PGDATABASE=mydb \
  -e PGUSER=myuser -e PGPASSWORD=mypass \
  andahme/postgres:no-volume

  
## Stop container
**NOTE**: It is also safe to use 'ctrl-c' to signal postgres for shutdown.
```bash
docker stop postgres
```

## Commit changes
```bash
docker commit \
  postgres andahme/application-db:no-volume
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

