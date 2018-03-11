FROM andahme/build-essential:testing


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --yes --no-install-recommends python3 python3-dev python3-pip python3-setuptools python3-venv python3-wheel

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 0 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 0

RUN useradd --comment "Python User" --create-home --uid 1011 python


USER python

CMD python

