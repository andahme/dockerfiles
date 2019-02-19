# andahme/python

## Quick Start

### Python REPL
```bash
docker run -it --rm \
  andahme/python
```

### Bash Shell w/Mounted Workspace
```bash
docker run -it --rm \
  --volume ${PWD}:/workspace \
  andahme/python \
  bash
```

## Notes

### Feature(s)
* Python
* C/C++ compilation
* Contains a `python` user
* Working directory `/workspace`

### Use Case(s)
* Python REPL/Shell
  * Create volumes for caches
* Base image for Application
  * Do not declare a volume, python libs should be installed into a new layer
  * Be sure to run `pip install --system --no-cache`
* Developer/REPL image
  * Declare volume(s)
    * Python/Pip cache
    * Python Global Library

