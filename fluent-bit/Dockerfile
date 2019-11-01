ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_FLUENTBIT_VERSION=0.14.8

ARG FLUENTBIT_ARTIFACT=https://github.com/fluent/fluent-bit/archive/v${INPUT_FLUENTBIT_VERSION}.tar.gz



FROM ${INPUT_DOCKER_REGISTRY}/build-essential:base AS distribution

ARG FLUENTBIT_ARTIFACT


ADD ${FLUENTBIT_ARTIFACT} /tmp/fluent-bit.tar.gz

RUN tar -zxf /tmp/fluent-bit.tar.gz -C /workspace --strip-components=1

RUN apt-get update && \
    apt-get install --yes cmake

WORKDIR /workspace/build

RUN cmake .. && make



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS fluent-bit

EXPOSE 24224


COPY --from=distribution /workspace/build/bin/fluent-bit /usr/local/bin/fluent-bit


RUN apt-get update && \
    apt-get install --yes ca-certificates


USER daemon

CMD [ "fluent-bit" ]

