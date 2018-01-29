## Quick Start

### Start an NGINX Server
```bash
docker run -d --name nginx -p 80:80 \
  -v /var/www/html:/var/www/html \
  andahme/nginx
```

