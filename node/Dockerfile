FROM andahme/build-essential


RUN DEBIAN_FRONTEND=noninteractive \
    echo deb http://deb.nodesource.com/node_7.x jessie main > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends nodejs

