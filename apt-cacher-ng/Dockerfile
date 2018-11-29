ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS apt-cacher-ng

EXPOSE 3142


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends apt-cacher-ng && \
    chown apt-cacher-ng /etc/apt-cacher-ng /etc/apt-cacher-ng/acng.conf /var/cache/apt-cacher-ng /var/log/apt-cacher-ng

COPY docker-entrypoint.sh /docker-entrypoint.sh


VOLUME /var/cache/apt-cacher-ng


USER apt-cacher-ng

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "apt-cacher-ng", "-c", "/etc/apt-cacher-ng" ]

