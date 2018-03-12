## Quick Start

### Python REPL
```bash
docker run -it \
  andahme/python
```

### Bash Shell w/Mounted Workspace
```bash
docker run -it \
  --volume ${PWD}:/workspace \
  andahme/python bash
```

