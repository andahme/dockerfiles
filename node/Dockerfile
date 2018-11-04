ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_NODE_ARCH=x64

ARG INPUT_NODE_VERSION=11.1.0

ARG NODE_ARTIFACT=https://nodejs.org/dist/v${INPUT_NODE_VERSION}/node-v${INPUT_NODE_VERSION}-linux-${INPUT_NODE_ARCH}.tar.gz



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS distribution

ARG NODE_ARTIFACT


ADD ${NODE_ARTIFACT} /tmp/node.tar.gz

RUN tar -zxf /tmp/node.tar.gz -C /opt --strip-components=1



FROM ${INPUT_DOCKER_REGISTRY}/build-essential:testing AS no-volume

ARG INPUT_NODE_VERSION


ENV NODE_HOME /opt/node-${INPUT_NODE_VERSION}

ENV PATH ${NODE_HOME}/bin:${PATH}


COPY --from=distribution /opt ${NODE_HOME}


RUN ln -s ${NODE_HOME}/bin/node ${NODE_HOME}/bin/nodejs

RUN useradd --comment "Node User" --create-home --uid 1011 node


USER node



FROM ${INPUT_DOCKER_REGISTRY}/node:${INPUT_NODE_VERSION}-no-volume AS node

VOLUME ${NODE_HOME}/lib/node_modules

VOLUME /workspace

