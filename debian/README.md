# andahme/debian

## Quick Start

```bash
docker run -it --rm \
  andahme/debian
```

## Notes

### Build Instructions

##### Install Docker CE and debootstrap tools
```bash
apt-get update && \
  apt-get --yes install docker-ce && \
  apt-get --yes install debootstrap xz-utils
```

##### Make Debian Images
```bash
export DOCKER_REGISTRY="andahme"
export ARCH="amd64"
```
```bash
cd /usr/share/docker-ce/contrib

./mkimage.sh -t ${DOCKER_REGISTRY}/debian:testing-${ARCH} debootstrap --variant=minbase testing
./mkimage.sh -t ${DOCKER_REGISTRY}/debian:stretch-${ARCH} debootstrap --variant=minbase stretch
./mkimage.sh -t ${DOCKER_REGISTRY}/debian:jessie-${ARCH} debootstrap --variant=minbase jessie

docker push ${DOCKER_REGISTRY}/debian:testing-${ARCH}
docker push ${DOCKER_REGISTRY}/debian:stretch-${ARCH}
docker push ${DOCKER_REGISTRY}/debian:jessie-${ARCH}
```

