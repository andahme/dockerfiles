# andahme/python
## Feature(s)
* Python
* C/C++ compilation
* Contains a `builder` user
* Working directory `/workspace`

## QuickStart
#### Python REPL
```bash
docker run -it \
  --user builder \
  andahme/python
```

#### Shell w/Local Mount Workspace
```bash
docker run -it \
  --user builder \
  -v ${PWD}:/workspace \
  andahme/python bash
```
