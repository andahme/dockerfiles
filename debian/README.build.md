## Build Image(s)

#### Install Docker CE


#### Prepare Debootstrap
```bash
apt-get update && apt-get --yes install debootstrap xz-utils
```

#### Create Base Image(s)
```bash
pushd /usr/share/docker-ce/contrib
    ./mkimage.sh -t andahme/debian:testing debootstrap --variant=minbase testing
    ./mkimage.sh -t andahme/debian:stretch debootstrap --variant=minbase stretch
    ./mkimage.sh -t andahme/debian:jessie debootstrap --variant=minbase jessie
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


