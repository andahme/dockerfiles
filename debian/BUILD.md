## Build Image(s)

#### Install Docker CE


#### Prepare Debootstrap
```bash
apt-get update && apt-get --yes install debootstrap xz-utils
```

#### Create Base Image(s)
```bash
export DEBIAN_MIRROR="http://apt-cacher.lab.andah.me:3142/debian"
export DOCKER_REGISTRY="registry.lab.andah.me"
```
```bash
pushd /usr/share/docker-ce/contrib
    ./mkimage.sh -t ${DOCKER_REGISTRY:-andahme}/debian:testing debootstrap --variant=minbase testing ${DEBIAN_MIRROR}
    ./mkimage.sh -t ${DOCKER_REGISTRY:-andahme}/debian:stretch debootstrap --variant=minbase stretch ${DEBIAN_MIRROR}
    ./mkimage.sh -t ${DOCKER_REGISTRY:-andahme}/debian:jessie debootstrap --variant=minbase jessie ${DEBIAN_MIRROR}
popd
```

## Re-Tagging

#### Testing
```bash
docker tag andahme/debian:testing andahme/debian:latest
```

#### Stretch
```bash
docker tag andahme/debian:stretch andahme/debian:stable
docker tag andahme/debian:stretch andahme/debian:9
```

#### Jessie
```bash
docker tag andahme/debian:jessie andahme/debian:8
```


