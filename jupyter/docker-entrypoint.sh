#!/bin/bash -e


mkdir ${HOME}/.jupyter

echo """
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.token = '${JUPYTER_TOKEN:-8888}'
""" >> ${HOME}/.jupyter/jupyter_notebook_config.py


exec $@

