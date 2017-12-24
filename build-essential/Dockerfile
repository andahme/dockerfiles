FROM andahme/debian


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential && \
    adduser --system --home /workspace --shell /bin/bash --group --gecos "Build User" builder


VOLUME /workspace


USER builder

WORKDIR /workspace

