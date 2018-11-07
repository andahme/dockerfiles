## Build Image(s)

#### Install Docker CE


#### Prepare for Debootstrap
```bash
apt-get update && apt-get --yes install debootstrap xz-utils
```

#### Make Debian Image(s)
```bash
export DOCKER_REGISTRY="registry.lab.andah.me"

export DEBIAN_MIRROR="http://apt-cacher.lab.andah.me:3142/debian"
```
```
function mkDebian {
  ./mkimage.sh -t ${DOCKER_REGISTRY}/debian:$1 debootstrap --variant=minbase $1 ${DEBIAN_MIRROR}
}
```
```bash
cd /usr/share/docker-ce/contrib

mkDebian testing
mkDebian stretch
mkDebian jessie
```

#### Push Debian Images
```bash
function dPush {
  docker push ${DOCKER_REGISTRY}/debian:$1
}
```
```
dPush testing
dPush stretch
dPush jessie
```

#### Tag and Push
```bash
function tPush {
  docker tag ${DOCKER_REGISTRY}/debian:$1 ${DOCKER_REGISTRY}/debian:$2
  docker push ${DOCKER_REGISTRY}/debian:$2
}
```
```
# testing/latest
tPush testing latest

# stretch/9
tPush stretch stable
tPush stretch 9

# jessie/8
tPush jessie 8
```

