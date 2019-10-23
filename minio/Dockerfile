ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_MINIO_REPO=https://github.com/minio/minio.git



FROM ${INPUT_DOCKER_REGISTRY}/golang:build AS distribution

ARG INPUT_MINIO_REPO


ENV CGO_ENABLED 0

ENV GO111MODULE on


RUN git clone ${INPUT_MINIO_REPO} .

RUN go install -v -ldflags "$(go run buildscripts/gen-ldflags.go)"



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS minio


ENV MINIO_ACCESS_KEY 0009

ENV MINIO_SECRET_KEY 00090009


COPY --from=distribution /workspace/go/bin/minio /usr/local/bin/minio


RUN useradd --comment "Minio User" --system --uid 511 minio

RUN mkdir -p /data && \
    chown minio /data


VOLUME /data


CMD [ "/usr/local/bin/minio", "server", "/data" ]

USER minio

