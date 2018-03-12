FROM andahme/debian:testing AS docker


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends apt-transport-https ca-certificates curl gnupg

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    echo deb https://download.docker.com/linux/debian stretch stable > /etc/apt/sources.list.d/docker.list

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends docker-ce


