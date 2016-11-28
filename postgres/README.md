# Quick Start

## Parameters
```bash
export DATA_VOLUME="testing_data"
```
```bash
export PG_CONTAINER="testing_pg"
```

## Create PostgreSQL Cluster
**NOTE**: Cluster creation must include a user override (`root`).
**NOTE**: Cluster creation will prompt for a password.
```bash
docker run -it --name ${DATA_VOLUME} --user root \
    andahme/postgres initdb
```

## Start PostgreSQL Server
```bash
docker run -d --name ${PG_CONTAINER} --volumes-from=${DATA_VOLUME} \
    andahme/postgres
```

## Connect with PostgreSQL Client
**NOTE** If a link (alias `DB`) is present, `host` (`-h`) and `port` (`-p`) will be provided to `psql`.
```bash
docker run -it --link ${PG_CONTAINER}:DB \
    andahme/postgres psql
```
