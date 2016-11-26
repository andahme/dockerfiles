FROM andahme/debian


RUN echo deb http://deb.nodesource.com/node_7.x jessie main > /etc/apt/sources.list.d/nodesource.list

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -- \
    && apt-get install -y --force-yes --no-install-recommends nodejs \
    && apt-get clean

