ARG INPUT_DEBIAN_RELEASE=testing



FROM andahme/debian:${INPUT_DEBIAN_RELEASE} AS apt-cacher

EXPOSE 3142


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends apt-cacher

COPY apt-cacher.conf /etc/apt-cacher/apt-cacher.conf


VOLUME /var/cache/apt-cacher


USER www-data

CMD [ "apt-cacher" ]

