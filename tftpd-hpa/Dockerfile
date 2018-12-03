ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS tftp

EXPOSE 6969


RUN apt-get update && \
    apt-get install --yes --no-install-recommends tftpd-hpa


USER tftp

CMD [ "/usr/sbin/in.tftpd", "--address", "0.0.0.0:6969", "--foreground", "--ipv4" ]


