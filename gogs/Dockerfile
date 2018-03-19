FROM andahme/debian AS distribution


ADD https://dl.gogs.io/0.11.34/linux_amd64.tar.gz /tmp/gogs-0.11.34.tar.gz

RUN tar -zxf /tmp/gogs-0.11.34.tar.gz -C /opt --strip-component=1 && \
    mkdir /opt/log && \
    chmod 777 /opt/log


FROM andahme/debian:testing AS gogs

ENV GOGS_HOME /opt/gogs-0.11.34


COPY --from=distribution /opt ${GOGS_HOME}


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends git

RUN useradd --comment "Git Process User" --create-home --uid 1011 git && \
    mkdir /data && \
    chmod 777 /data


USER git

