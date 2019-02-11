ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_COREDNS_ARCH=amd64

ARG INPUT_COREDNS_VERSION=1.3.1


ARG COREDNS_ARTIFACT=https://github.com/coredns/coredns/releases/download/v${INPUT_COREDNS_VERSION}/coredns_${INPUT_COREDNS_VERSION}_linux_${INPUT_COREDNS_ARCH}.tgz


FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS distribution

ARG COREDNS_ARTIFACT


ADD ${COREDNS_ARTIFACT} /tmp/coredns.tar.gz

RUN tar -zxf /tmp/coredns.tar.gz -C /opt



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS coredns

EXPOSE 5353


COPY --from=distribution /opt/coredns /usr/local/bin/coredns

COPY Corefile /etc/coredns/Corefile

RUN useradd --comment "CoreDNS Process User" --system --uid 511 coredns


VOLUME [ "/etc/coredns" ]


USER coredns

CMD [ "coredns", "-conf", "/etc/coredns/Corefile", "-dns.port", "5353" ]

