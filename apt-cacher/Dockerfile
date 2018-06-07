ARG INPUT_DEBIAN_RELEASE=testing



FROM andahme/debian:${INPUT_DEBIAN_RELEASE} AS apt-cacher

EXPOSE 3142


ENV APT_CACHER_REPO_MAP "debian http://ftp.us.debian.org/debian ; debian-security http://security.debian.org/debian-security ;"


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends apt-cacher && \
    chown www-data /etc/apt-cacher/apt-cacher.conf /var/cache/apt-cacher /var/log/apt-cacher

COPY docker-entrypoint.sh /docker-entrypoint.sh


VOLUME /var/cache/apt-cacher


USER www-data

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "apt-cacher" ]

