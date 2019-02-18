ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/build-essential:testing AS golang

ENV GOPATH /workspace/go


RUN apt-get update && \
    apt-get install --yes --no-install-recommends ca-certificates git golang go-dep


USER builder

