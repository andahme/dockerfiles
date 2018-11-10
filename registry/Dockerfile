ARG INPUT_DOCKER_REGISTRY=registry.lab.andah.me


FROM ${INPUT_DOCKER_REGISTRY}/build-essential:testing AS distribution

ENV GOPATH /root/go


RUN apt-get update && \
    apt-get install --yes git golang

RUN go get github.com/docker/distribution/cmd/registry



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS registry

EXPOSE 5000


COPY --from=distribution /root/go/bin/registry /bin/registry

COPY config.yml /etc/docker/registry/config.yml


RUN apt-get update && \
    apt-get install --yes ca-certificates apache2-utils


VOLUME [ "/var/lib/registry" ]


CMD [ "registry", "serve", "/etc/docker/registry/config.yml" ]

