## Quick Start

### Start an NGINX Server
```bash
docker run -d --name nginx -p 80:8080 \
  -v ${PWD}:/var/www/html \
  andahme/nginx
```

