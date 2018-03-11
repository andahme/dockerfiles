## Quick Start

#### Scala REPL
```bash
docker run -it --rm --name scala \
  andahme/scala
```

#### Bash Shell w/Mounted Workspace
```bash
docker run -it --rm --name scala \
  --volume ${PWD}:/workspace \
  andahme/scala bash
```

