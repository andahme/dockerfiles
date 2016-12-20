FROM andahme/debian


EXPOSE 4369

EXPOSE 5672

EXPOSE 25672


ENV PATH /usr/lib/rabbitmq/bin:$PATH

ENV RABBITMQ_LOGS -

ENV RABBITMQ_SASL_LOGS -

ENV RABBITMQ_CTL_ERL_ARGS -setcookie "1234567890987654321"

ENV RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS -setcookie "1234567890987654321"


RUN DEBIAN_FRONTEND=noninteractive \
    echo deb http://www.rabbitmq.com/debian testing main > /etc/apt/sources.list.d/rabbitmq.list \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends rabbitmq-server \
    && rm /etc/apt/sources.list.d/rabbitmq.list


VOLUME [ "/etc/rabbitmq" ]

VOLUME [ "/var/lib/rabbitmq" ]


USER rabbitmq


