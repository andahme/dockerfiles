## Quick Start

### Python REPL
```bash
docker run -it \
  andahme/python
```

### Shell w/Local Mount Workspace
```bash
docker run -it \
  --volume ${PWD}:/workspace \
  andahme/python bash
```

