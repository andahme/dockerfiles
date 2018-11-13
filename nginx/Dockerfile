ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing

EXPOSE 80


RUN apt-get update && \
    apt-get install --yes --no-install-recommends nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log


CMD [ "nginx", "-g", "daemon off;" ]

