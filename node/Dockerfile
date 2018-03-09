ARG INPUT_NODE_VERSION=9.8.0

ARG NODE_ARTIFACT=https://nodejs.org/dist/v${INPUT_NODE_VERSION}/node-v${INPUT_NODE_VERSION}-linux-x64.tar.gz



FROM andahme/debian AS distribution

ARG NODE_ARTIFACT


ADD ${NODE_ARTIFACT} /tmp/node.tar.gz

RUN tar -zxf /tmp/node.tar.gz -C /opt --strip-components=1



FROM andahme/build-essential:testing AS no-volume

ARG INPUT_NODE_VERSION


ENV NODE_HOME /opt/node-${INPUT_NODE_VERSION}

ENV PATH ${NODE_HOME}/bin:${PATH}


COPY --from=distribution --chown=root:builder /opt ${NODE_HOME}


RUN ln -s ${NODE_HOME}/bin/node ${NODE_HOME}/bin/nodejs


USER builder



FROM andahme/node:no-volume AS node

VOLUME ${NODE_HOME}/lib/node_modules

VOLUME /workspace

