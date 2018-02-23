FROM andahme/debian:testing


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential

RUN useradd --comment "Build User" --create-home --uid 1011 builder

RUN mkdir /workspace && \
    chown builder /workspace


WORKDIR /workspace

