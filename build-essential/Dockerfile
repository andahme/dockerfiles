ARG INPUT_DEBIAN_RELEASE=testing

ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:${INPUT_DEBIAN_RELEASE} AS build-essential


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential

RUN useradd --comment "Build User" --system --uid 511 builder

RUN mkdir /workspace && \
    chmod 777 /workspace


WORKDIR /workspace

