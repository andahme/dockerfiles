ARG INPUT_JAVA_MAJOR=8



FROM andahme/openjdk:${INPUT_JAVA_MAJOR}-jre AS jenkins


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends git gnupg wget

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add - && \
    echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends jenkins

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get remove --yes --purge gnupg wget && \
    apt-get autoremove --yes


VOLUME /var/lib/jenkins


CMD [ "java", "-jar", "/usr/share/jenkins/jenkins.war" ]

USER jenkins

