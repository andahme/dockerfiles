# Quick Start

## Parameters
```bash
export DATA_VOLUME="testing_data"
```
```bash
export PG_CONTAINER="testing_pg"
```

## Initialize Cluster
**NOTE**: Options following `initdb` will be passed along to `pg_createcluster`.

#### With Docker Data Volume
```bash
docker run -it --name ${DATA_VOLUME} --user root \
    andahme/postgres initdb --pwprompt
```

#### With Local Filesystem Mapping
**NOTE**: Using a Docker container to anchor a local filesystem mapping is not required.
```bash
docker run -it --name ${DATA_VOLUME} --user root \
    -v /etc/postgresql:/etc/postgresql -v /var/lib/postgresql:/var/lib/postgresql \
    andahme/postgres initdb --pwprompt
```

## Start Postgres
```bash
docker run -it --name ${PG_CONTAINER} --volumes-from=${DATA_VOLUME} -p 5432:5432 \
    andahme/postgres
```
