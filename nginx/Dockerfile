FROM andahme/debian


EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends nginx \
    && apt-get clean

