ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS nginx

EXPOSE 8080


RUN apt-get update && \
    apt-get install --yes --no-install-recommends nginx

RUN sed s/^user/#user/g /etc/nginx/nginx.conf -i && \
    sed s/80/8080/g /etc/nginx/sites-available/default -i && \
    chown root:www-data /run /var/lib/nginx && \
    chmod 775 /run /var/lib/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log


CMD [ "nginx", "-g", "daemon off;" ]

USER www-data

