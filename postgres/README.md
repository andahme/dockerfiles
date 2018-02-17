## Quick Start

### Server
**NOTE**: Creates initial user (`postgres`) with password (`2345`).  
**NOTE**: Creates an initial user database (`postgres`).  
**NOTE**: Publishes the database on (`5432`) of the localhost interface (`127.0.0.1`).  
```bash
docker run -d --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --publish 127.0.0.1:5432:5432 \
  andahme/postgres
```

### Client
**NOTE**: The default connection host (`postgres`) is defined in the `PGHOST` environment variable.  
```bash
docker run -it --rm \
  --network ${NETWORK} \
  andahme/postgres psql
```

## Explicit Initialization/Startup

### Initialize Database Cluster
**NOTE**: Initializes a data volume (`pg-data`) with a new database cluster.  
**NOTE**: Removes the application container (`-rm`) after initialization.  
```bash
docker run -it --rm \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres initdb
```

### Start Server
**NOTE**: Mount the data volume (`pg-data`) to an new application container at PGDATA (`/var/lib/postgresql`).  
**NOTE**: Connects to a docker network (`${NETWORK}`) with a resolvable network alias (`postgres`).  
```bash
docker run -d --name postgres \
  --network ${NETWORK} --network-alias postgres \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres noinitdb
```


## Single-User Mode
**NOTE**: Do not attempt to use on a running database.  
```bash
docker run -it --rm \
  --volumes-from postgres \
  andahme/postgres postgres --single
```



## Advanced Tips

### Authorization

##### To initialize the database cluster with no authentication
* Add the environment setting (`-e INITDB_AUTH_OPTIONS="--auth trust"`).  

##### Pass additional arguments to `initdb`
* Add `initdb` arguments without losing the defaults from (`INITDB_AUTH_OPTIONS`).  

##### Supply a bootstrap password
* Place a password file (or docker secret) at the path (`/run/secrets/pg_password`).  
* If a password file is not present, an environment variable (`INITDB_BOOTSTRAP_PASSWORD`).  
* If the environment variable (`INITDB_BOOTSTRAP_PASSWORD`) is not set, the default (`2345`) is used.  
