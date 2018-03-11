## Quick Start (Host Networking)

### Start Server
**NOTE**: Creates initial user (`postgres`) with password (`2345`).  
**NOTE**: Creates an initial user database (`postgres`).  
```bash
docker run -d --name postgres \
  --network host \
  andahme/postgres
```

### Run Client
**NOTE**: The 'host' network is necessary when connecting to the `localhost` interface.  
```bash
docker run -it --rm \
  --network host \
  andahme/postgres psql -h localhost
```

