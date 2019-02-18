ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS build-essential


RUN apt-get update && \
    apt-get install --yes --no-install-recommends build-essential

RUN useradd --comment "Build User" --system --uid 511 builder

RUN mkdir /workspace && \
    chmod 777 /workspace


WORKDIR /workspace

