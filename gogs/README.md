```bash
docker run -it --rm --name gogs \
  --publish 127.0.0.1:3000:3000 \
  andahme/gogs
```

docker run -it --rm --name gogs --publish 127.0.0.1:3000:3000 --volume /Users/gutano/source/andahme/dockerfiles/gogs:/data andahme/gogs
