FROM andahme/python AS jupyter

EXPOSE 8888


ENV PATH /home/python/.local/bin:${PATH}


RUN pip install --no-cache-dir jupyterlab

COPY docker-entrypoint.sh /docker-entrypoint.sh


VOLUME /home/python/.local


ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "jupyter", "lab" ]

