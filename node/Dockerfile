FROM andahme/build-essential


RUN DEBIAN_FRONTEND=noninteractive \
    echo deb http://deb.nodesource.com/node_8.x jessie main > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install --yes --allow-unauthenticated --no-install-recommends nodejs

