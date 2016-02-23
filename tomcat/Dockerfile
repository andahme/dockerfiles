FROM andahme/jre


EXPOSE 8009 8080

CMD ["/usr/share/tomcat7/bin/catalina.sh", "run"]

ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7

WORKDIR /usr/share/tomcat7


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends tomcat7 \
    && apt-get clean


