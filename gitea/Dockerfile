ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_GITEA_ARCH=amd64

ARG INPUT_GITEA_VERSION=1.7.6



FROM ${INPUT_DOCKER_REGISTRY}/debian:base

ARG INPUT_GITEA_ARCH

ARG INPUT_GITEA_VERSION


EXPOSE 2222

EXPOSE 3000


ENV GITEA_WORK_DIR /var/lib/gitea

ENV USERNAME gitea


ADD https://github.com/go-gitea/gitea/releases/download/v${INPUT_GITEA_VERSION}/gitea-${INPUT_GITEA_VERSION}-linux-${INPUT_GITEA_ARCH} /usr/local/bin/gitea

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN chmod +x /usr/local/bin/gitea

RUN apt-get update && \
    apt-get install --yes --no-install-recommends ca-certificates git openssh-client

RUN useradd --comment "Gitea Process User" --create-home --uid 1011 gitea && \
    mkdir -p /home/gitea/gitea-repositories /var/lib/gitea && \
    chown -R gitea /home/gitea/gitea-repositories /var/lib/gitea


VOLUME /var/lib/gitea


WORKDIR /var/lib/gitea

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "gitea", "web" ]

USER gitea

