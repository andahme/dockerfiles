## Build Image(s)

#### Install Docker CE and debootstrap tools
```bash
apt-get update && \
  apt-get --yes install docker-ce && \
  apt-get --yes install debootstrap xz-utils
```

#### Make Debian Image(s)
NOTE: As root
```bash
export DOCKER_REGISTRY="registry.lab.andah.me"

export DEBIAN_MIRROR="http://apt-cacher.lab.andah.me:3142/debian"
```
```bash
cd /usr/share/docker-ce/contrib

./mkimage.sh -t ${DOCKER_REGISTRY}/debian:testing debootstrap --variant=minbase testing ${DEBIAN_MIRROR}
./mkimage.sh -t ${DOCKER_REGISTRY}/debian:stretch debootstrap --variant=minbase stretch ${DEBIAN_MIRROR}
./mkimage.sh -t ${DOCKER_REGISTRY}/debian:jessie debootstrap --variant=minbase jessie ${DEBIAN_MIRROR}

docker push ${DOCKER_REGISTRY}/debian:testing
docker push ${DOCKER_REGISTRY}/debian:stretch
docker push ${DOCKER_REGISTRY}/debian:jessie
```

