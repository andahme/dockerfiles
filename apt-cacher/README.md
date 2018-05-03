#### Start Apt Cacher
```bash
docker run -d --rm --name apt \
  --network docker.andah.me \
  --volume apt-cacher:/var/cache/apt-cacher \
  --publish 0.0.0.0:3142:3142 \
  andahme/apt-cacher
```

#### Install Apt Sources
```bash
echo deb http://apt.docker.andah.me:3142/debian testing main contrib non-free > /etc/apt/sources.list
echo deb http://apt.docker.andah.me:3142/debian-security testing/updates main contrib non-free >> /etc/apt/sources.list
```

