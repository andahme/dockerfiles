# Project Goal(s)
Provide developer/development focused Docker image(s).

#### Application(s)
* Database(s)
* Messaging/Queue(s)
* Webserver(s)

#### Base/Build Image(s)
* Compiler(s)
* Runtime(s)

#### Utility
* Build-Process/Support
* Sandbox (REPL/Shell)
* Tool(s)


# Usage

## Quick Start

### Create (User Defined) Network
```bash
docker network create ${NETWORK:=andahme}
```

### Start a (Debian) Container
```bash
docker run -it --name myapplication --network ${NETWORK} andahme/debian
```

### Make Changes and Exit
```bash
apt-get update && apt-get install --yes --no-install-recommends nginx
exit
```

### Commit Changes & Cleanup
```bash
docker commit myapplication myrepo/myapplication:snapshot
docker rm myapplication
```

### Run Custom Image
```bash
docker run -d --name myapplication \
  --network ${NETWORK} \
  --publish 127.0.0.1:8080:80 \
  myrepo/myapplication:snapshot nginx -g daemon\ off\;
```
