ARG INPUT_DOCKER_REGISTRY=andahme



FROM ${INPUT_DOCKER_REGISTRY}/debian:testing AS rabbit


EXPOSE 4369

EXPOSE 5672

EXPOSE 25672


ENV PATH /usr/lib/rabbitmq/bin:$PATH

ENV RABBITMQ_LOGS -

ENV RABBITMQ_SASL_LOGS -

ENV RABBITMQ_CTL_ERL_ARGS -setcookie "1234567890987654321"

ENV RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS -setcookie "1234567890987654321"


RUN apt-get update && \
    apt-get install --yes \
      apt-transport-https \
      curl \
      gnupg2

RUN curl -L https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | apt-key add -

RUN echo deb http://www.rabbitmq.com/debian testing main > /etc/apt/sources.list.d/rabbit.list

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
      rabbitmq-server


VOLUME [ "/etc/rabbitmq" ]

VOLUME [ "/var/lib/rabbitmq" ]


USER rabbitmq


