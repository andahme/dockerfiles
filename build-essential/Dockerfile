FROM andahme/debian


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends build-essential

RUN useradd --comment "Builder User" --create-home --uid 511 builder

RUN mkdir /workspace && \
    chown builder /workspace


WORKDIR /workspace

