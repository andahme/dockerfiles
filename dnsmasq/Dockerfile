FROM andahme/debian:testing


COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN apt-get update && \
    apt-get install --yes --no-install-recommends dnsmasq


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "dnsmasq", "-d", "--no-hosts", "--no-resolv" ]
