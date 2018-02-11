## Quick Start


### Server
**NOTE**: Creates initial user (`postgres`) with password (`2345`).  
**NOTE**: Creates a database (`postgres`) based on the default template.  
**NOTE**: Add (`-e INITDB_OPTIONS="--auth trust"`) to initialize with no authentication.  
```bash
docker run -d --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --publish 127.0.0.1:5432:5432 \
  andahme/postgres
```

### Client
**NOTE**: The default connection (`localhost`) is configured in the `PGHOST` environment variable.  
```bash
docker run -it --rm \
  --network host \
  andahme/postgres psql
```


## Utilities

### Single-User Mode
**NOTE**: Do not attempt to use on a running database.  
```bash
docker run -it --rm \
  --volumes-from postgres \
  andahme/postgres postgres --single
```

### Initialize a database
**NOTE**: This creates and initializes a named (`pg-data`) data volume.  
```bash
docker run -it --rm \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres init
```

### Start postgres with a 
```bash
docker run -d --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres
```
