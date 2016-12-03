## Quick Start

### Start a PostgreSQL Server (Data Volume Container)
**NOTE**: Admin user `postgres`, initial password `2345`.</br>
**NOTE**: Add port mapping (`-p 5432:5432`) to expose on host interface(s).</br>
**NOTE**: Docker *data volumes* will be created for `/etc/postgresql` and `/var/lib/postgresql`.</br>
```bash
docker run -d --name ${PG_CONTAINER} \
    andahme/postgres
```

## Utilities

### PostgreSQL Client (Container Link)
**NOTE**: When a link alias (`DB`) is present, host (`-h`) and port (`-p`) parameters will be supplied to `psql`.</br>
```bash
docker run -it --link ${PG_CONTAINER}:DB \
    andahme/postgres psql
```

### Single-User Mode (Mounted Data Volume)
**NOTE**: Do not use while database is running.</br>
```bash
docker run -it --volumes-from ${PG_CONTAINER} \
    andahme/postgres single
```

## Advanced

### Create PostgreSQL Cluster (Data Volume Container, Directory Mapping)
```bash
docker run -it --name ${DATA_VOLUME} --user root \
    -v /etc/postgresql:/etc/postgresql \
    -v /var/lib/postgresql:/var/lib/postgresql \
    andahme/postgres initdb
```

### Start PostgreSQL Server (Mounted Data Volume)
```bash
docker run -d --name ${PG_CONTAINER} --volumes-from ${DATA_VOLUME} \
    andahme/postgres
```
