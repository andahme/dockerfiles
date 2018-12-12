ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS isc-dhcp-server

EXPOSE 67


RUN apt-get update && \
    apt-get install --yes --no-install-recommends isc-dhcp-server

RUN useradd --comment "DHCPd Process User" --system --uid 511 dhcpd


VOLUME [ "/var/lib/dhcp" ]


CMD [ "dhcpd", "-4", "-f", "-d", "-user", "dhcpd", "eth0.1" ]


