ARG INPUT_DOCKER_REGISTRY=andahme


FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS grafana

EXPOSE 3000


RUN apt-get update && \
    apt-get install --yes apt-transport-https curl gnupg

RUN curl https://packagecloud.io/gpg.key | apt-key add -

RUN echo deb https://packagecloud.io/grafana/stable/debian/ stretch main > /etc/apt/sources.list.d/grafana.list

RUN apt-get update && \
    apt-get install --yes grafana

RUN sed -i \
      -e "s/;data/data/g" \
      -e "s/;plugins/plugins/g" \
      -e "s/;mode.*/mode\ =\ console/g" \
      /etc/grafana/grafana.ini


VOLUME /var/lib/grafana


CMD [ "grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana" ]

USER grafana

