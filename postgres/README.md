## Quick Start (User Defined Network)

#### Postgres Server
**NOTE**: Creates initial user (`postgres`) with password (`2345`).  
**NOTE**: Creates an initial user database (`postgres`).  
**NOTE**: Publishes the database on (`5432`) of the localhost interface (`127.0.0.1`).  
```bash
docker run -d --name postgres \
  --network ${NETWORK} \
  --publish 127.0.0.1:5432:5432 \
  andahme/postgres
```

#### Postgres Client
**NOTE**: The default host connection (`PGHOST`) has been pre-defined (`postgres`).   
```bash
docker run -it --rm \
  --network ${NETWORK} \
  andahme/postgres psql
```

