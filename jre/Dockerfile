FROM andahme/debian


RUN echo "deb http://s3.andah.me/debian testing non-free" >> /etc/apt/sources.list.d/andahme.list

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends oracle-java8-jre \
    && apt-get clean


ENV JAVA_HOME /usr/lib/jvm/jre-8-oracle-x64

