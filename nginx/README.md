## Quick Start

### Start an NGINX Server
```bash
docker run -d --name ${NGINX_CONTAINER} -p 80:80 \
    -v /var/www/html:/var/www/html \
    andahme/nginx
```

