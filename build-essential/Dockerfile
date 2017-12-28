FROM andahme/debian


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential && \
    mkdir /workspace && \
    chown daemon /workspace


VOLUME /workspace

WORKDIR /workspace

