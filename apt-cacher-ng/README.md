#### Start Apt Cacher
```bash
docker run -d --restart always \
  --name apt-cacher --network docker.andah.me \
  --publish 0.0.0.0:3142:3142 \
  --volume apt-cacher-ng:/var/cache/apt-cacher-ng \
  andahme/apt-cacher-ng
```

#### Install Apt Sources
```bash
echo deb http://apt-cacher.docker.andah.me:3142/debian testing main contrib non-free > /etc/apt/sources.list
```

#### Use as a Proxy: TODO

