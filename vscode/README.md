## Quick Start

### VS Code Server
```bash
docker run \
  -it --rm \
  --name vscode \
  --publish 127.0.0.1:8080:8080 \
  --volume /tmp/workspace:/workspace andahme/vscode:testing \
  andahme/vscode:incubator
```

