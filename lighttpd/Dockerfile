ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS lighttpd

EXPOSE 8080


RUN apt-get update && \
    apt-get install --yes --no-install-recommends lighttpd && \
    chmod 777 /var/run

RUN sed -i s/80/8080/g /etc/lighttpd/lighttpd.conf


USER www-data

CMD [ "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]

