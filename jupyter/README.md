## Quick Start

###### Start Jupyter Notebook
```bash
docker run -it --rm --name jupyter \
  --publish 127.0.0.1:8888:8888 \
  --volume ${PWD}:/workspace \
  andahme/jupyter
```

###### Open Browser
- http://localhost:8888?token=8888

