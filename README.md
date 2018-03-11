## Quick Start

#### Create (User Defined) Network
```bash
docker network create ${NETWORK:=andahme}
```

#### Start a (Debian) Container
```bash
docker run -it --name myapplication --network ${NETWORK} andahme/debian
```

#### Make Changes
```bash
apt-get update && apt-get install --yes --no-install-recommends lighttpd
```
```bash
echo """<!DOCTYPE html>
<html>
  <head>
    <title>Ohai</title>
  </head>
  <body>
    <h2>andahme</h2>
  </body>
</html>""" > /var/www/html/index.lighttpd.html
```

#### Exit Container & Commit Changes
```bash
exit
```
```bash
docker commit myapplication myrepo/myapplication:snapshot && docker rm myapplication
```

### Run Custom Image
```bash
docker run -d --name myapplication \
  --network ${NETWORK} \
  --publish 127.0.0.1:8080:80 \
  myrepo/myapplication:snapshot lighttpd -D -f /etc/lighttpd/lighttpd.conf
```
