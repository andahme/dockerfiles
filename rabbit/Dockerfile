FROM andahme/debian


EXPOSE 4369

EXPOSE 5672

EXPOSE 25672


ENV PATH /usr/lib/rabbitmq/bin:$PATH

ENV RABBITMQ_LOGS -

ENV RABBITMQ_SASL_LOGSi -


RUN DEBIAN_FRONTEND=noninteractive \
    echo deb http://www.rabbitmq.com/debian testing main > /etc/apt/sources.list.d/rabbitmq.list \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends rabbitmq-server


VOLUME [ "/etc/rabbitmq" ]

VOLUME [ "/var/lib/rabbitmq" ]


USER rabbitmq

