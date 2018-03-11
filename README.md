## Quick Start

#### Start a (Debian) Container
**NOTE**: The `--rm` flag causes the container to be removed when the process/tty exits.
```bash
docker run -it --rm andahme/debian
```

## Advanced

### Create a (User Defined) Network
```bash
docker network create ${NETWORK:=andahme}
```

