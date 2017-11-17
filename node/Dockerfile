ARG NODE_VERSION=9.2.0

ARG NODE_ARTIFACT=https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz



FROM andahme/debian AS distribution

ARG NODE_ARTIFACT

ARG NODE_VERSION


ADD ${NODE_ARTIFACT} /tmp/node-${NODE_VERSION}.tar.gz

RUN tar -zxf /tmp/node-${NODE_VERSION}.tar.gz -C /opt --strip-components=1



FROM andahme/build-essential AS image

ARG NODE_VERSION


ENV NODE_HOME /opt/node-${NODE_VERSION}

ENV PATH ${NODE_HOME}/bin:${PATH}


COPY --from=distribution --chown=root:builder /opt ${NODE_HOME}


RUN ln -s ${NODE_HOME}/bin/node ${NODE_HOME}/bin/nodejs


VOLUME ${NODE_HOME}/lib/node_modules

