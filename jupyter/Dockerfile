FROM andahme/python:base AS jupyter

EXPOSE 8888


ENV PATH /home/jupyter/.local/bin:${PATH}


RUN pip install --no-cache-dir --system jupyter

COPY docker-entrypoint.sh /docker-entrypoint.sh


RUN useradd --comment "Jupyter User" --create-home --uid 1011 jupyter && \
    mkdir /home/jupyter/.cache /home/jupyter/.local && \
    chown jupyter:jupyter /home/jupyter/.local


VOLUME /home/jupyter/.local

VOLUME /workspace


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "jupyter", "notebook" ]

USER jupyter
