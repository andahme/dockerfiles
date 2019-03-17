## Quick Start

### Postgres Server
**NOTE**: Creates initial user (`postgres`) with password (`2345`).  
**NOTE**: Creates initial database (`postgres`).  
**NOTE**: Publishes the database on (`5432`) of the localhost interface (`127.0.0.1`).  
**NOTE**: Override database user with (`--env PGUSER=appuser`).  
**NOTE**: Override database password with (`--env PGPASSWORD=apppass`).  
**NOTE**: Override database name with (`--env PGDATABASE=appdb`).  
```bash
docker run -d --name postgres \
  --publish 127.0.0.1:5432:5432 \
  andahme/postgres
```

### Postgres Client
```bash
docker exec -it postgres psql
```

