#!/bin/bash -e


echo "ANDAHME Applying Configuration - APT_CACHER_REPO_MAP (${APT_CACHER_REPO_MAP})"
echo """## GENERATED ##
group = www-data
user = www-data
path_map = ${APT_CACHER_REPO_MAP}
allowed_hosts = *
debug = 1""" > /etc/apt-cacher/apt-cacher.conf


exec $@

