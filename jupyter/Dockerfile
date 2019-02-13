FROM andahme/python:base AS jupyter

EXPOSE 8888


RUN pip install --no-cache-dir --system jupyterlab

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Jupyter User" --create-home --uid 1011 jupyter && \
    mkdir /home/jupyter/.local && \
    chown jupyter:jupyter /home/jupyter/.local


VOLUME /home/jupyter/.local


USER jupyter


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "jupyter", "lab" ]

