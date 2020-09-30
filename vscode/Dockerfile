ARG INPUT_DOCKER_REGISTRY=andahme

ARG INPUT_VSCODE_VERSION=3.5.0

ARG VSCODE_ARTIFACT=https://github.com/cdr/code-server/releases/download/v${INPUT_VSCODE_VERSION}/code-server_${INPUT_VSCODE_VERSION}_amd64.deb



FROM ${INPUT_DOCKER_REGISTRY}/debian:base AS vscode

ARG VSCODE_ARTIFACT


EXPOSE 8080


ADD ${VSCODE_ARTIFACT} /tmp/code-server_${INPUT_VSCODE_VERSION}_amd64.deb

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN dpkg -i /tmp/code-server_${INPUT_VSCODE_VERSION}_amd64.deb

RUN useradd --comment "VScode Process User" --create-home --uid 1011 vscode


WORKDIR /workspace

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "code-server" ]

USER vscode

