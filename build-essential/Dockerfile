FROM andahme/debian


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential && \
    useradd --comment "Build User" --create-home --uid 511 builder && \
    mkdir /workspace && \
    chown builder /workspace


WORKDIR /workspace

