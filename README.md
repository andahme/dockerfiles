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

#### Make Changes
```bash
apt-get update && apt-get install --yes --no-install-recommends lighttpd
echo "<html><head><title>Ohai</title></head><body><h2>andahme</h2></body></html>" > /usr/share/lighttpd/index.html
```

#### Exit Container
```bash
exit
```

### Commit Changes
```bash
docker commit myapplication myrepo/myapplication:snapshot
```

### Run Custom Image
```bash
docker run -d --name myapplication \
  --network ${NETWORK} \
  --publish 127.0.0.1:8080:80 \
  myrepo/myapplication:snapshot lighttpd -D -f /etc/lighttpd/lighttpd.conf
```
