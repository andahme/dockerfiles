## Quick Start (User Defined Network)

### Start Server
**NOTE**: Publishes the database on (`5432`) of the localhost interface (`127.0.0.1`).  
```bash
docker run -d --name postgres \
  --network ${NETWORK} \
  --publish 127.0.0.1:5432:5432 \
  andahme/postgres
```

### Run Client
**NOTE**: The default host connection (`PGHOST`) has been pre-defined (`postgres`).   
```bash
docker run -it --rm \
  --network ${NETWORK} \
  andahme/postgres psql
```


## Explicit Initialization/Startup

### Initialize Database
**NOTE**: Initializes a data volume (`pg-data`) with a new database cluster.  
**NOTE**: Removes the application container (`-rm`) after initialization.  
```bash
docker run -it --rm \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres init
```

### Start Server
**NOTE**: Mount the data volume (`pg-data`) to an application container.  
**NOTE**: Connects to a user defined network (`${NETWORK}`) with alias (`postgres`).  
```bash
docker run -d --name postgres \
  --network ${NETWORK} \
  --volume pg-data:/var/lib/postgresql \
  andahme/postgres noinit
```


## Other Tips

### Run in Single-User Mode
**NOTE**: Do not attempt to use on a running database.  
```bash
docker run -it --rm \
  --volumes-from postgres \
  andahme/postgres postgres --single
```

### Initialize a Database Cluster

#### Auto-Configuration
**NOTE**: `/docker-entrypoint.sh` commands (`initdb`, `initsql`, `init`, `postgres`, `noinit`) do not accept parameters or arguments.  
**NOTE**: If (`INITDB_OPTIONS`) are provided, they are used without modification.  
**NOTE**: If (`/docker-entrypoint.sh`) `initdb` is run interactively, it will prompt for a password (`--pwprompt`).  
**NOTE**: If (`/docker-entrypoint.sh`) `initdb` is run in the background, a password file (`--pwfile /dev/shm/initdb_password`) will be used.  

#### Authorization (initdb + psql)
**NOTE**: If the (`PGDATABASE`) environment variable is not set, the default (`postgres`) will be used.  
**NOTE**: If the (`PGUSER`) environment variable is not set, the default (`postgres`) will be used.  

#### Authorization (initdb)
**NOTE**: To disable authentication entirely, set the (`INITDB_OPTIONS`) environment variable to (`--auth trust`).  
**NOTE**: If the (`INITDB_PASSWORD`) environment variable is not set, the default (`2345`) will be used.  
**NOTE**: To designate a password/secrets file, set the (`INITDB_PWFILE`) environment variable.  

