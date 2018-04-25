#### Start Apt Cacher
```bash
docker run -d --rm --name cache \
  --network debian \
  --volume apt-cacher:/var/cache/apt-cacher \
  --publish 0.0.0.0:3142:3142 \
  andahme/apt-cacher
```

#### Install Cache Source (Testing)
```bash
echo deb http://cache.docker.andah.me:3142/debian testing main contrib non-free > /etc/apt/sources.list
```

#### Install Cache Source (Stretch)
```bash
echo deb http://cache.docker.andah.me:3142/debian stretch main contrib non-free > /etc/apt/sources.list
echo deb http://cache.docker.andah.me:3142/debian-security stretch/updates main contrib non-free >> /etc/apt/sources.list
```

#### Install Cache Source (Jessie)
```bash
echo deb http://cache.docker.andah.me:3142/debian jessie main contrib non-free > /etc/apt/sources.list
echo deb http://cache.docker.andah.me:3142/debian-security jessie/updates main contrib non-free >> /etc/apt/sources.list
```

