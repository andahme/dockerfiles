#!/bin/bash -e


sed -i \
  -e "s/#\ \(ForeGround:\).*/\\1\ 1/g" \
  /etc/apt-cacher-ng/acng.conf


exec $@

