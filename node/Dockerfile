FROM andahme/debian


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends nodejs npm \
    && apt-get clean

