FROM andahme/python AS jupyter


ENV PATH /home/python/.local/bin:${PATH}


RUN pip install --no-cache jupyter matplotlib numpy pandas


CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser" ]


