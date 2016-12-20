FROM andahme/openjdk:jre


EXPOSE 8080


ENV CATALINA_BASE /var/lib/tomcat8

ENV CATALINA_HOME /usr/share/tomcat8


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends libservlet3.1-java tomcat8


VOLUME [ "/var/lib/tomcat8" ]


CMD [ "/usr/share/tomcat8/bin/catalina.sh", "run" ]


