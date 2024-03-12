ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS samba-ad-dc


RUN apt-get update && \
    apt-get install --yes samba winbind


VOLUME /etc/samba

VOLUME /var/lib/samba

