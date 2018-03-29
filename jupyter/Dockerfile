FROM andahme/python AS jupyter

EXPOSE 8888


ENV PATH /home/python/.local/bin:${PATH}


RUN pip install --no-cache-dir jupyterlab && \
    mkdir ${HOME}/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" > ${HOME}/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> ${HOME}/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = '8888'" >> ${HOME}/.jupyter/jupyter_notebook_config.py


CMD [ "jupyter", "lab" ]

