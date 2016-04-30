FROM andahme/debian


EXPOSE 80 443



RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends haproxy \
    && apt-get clean

RUN sed s/run/var\\/run/g /etc/haproxy/haproxy.cfg -i \
    && mkdir /var/run/haproxy


CMD ["/usr/sbin/haproxy-systemd-wrapper", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/var/run/haproxy.pid"]

