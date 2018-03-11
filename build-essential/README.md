# andahme/build-essential
This image is suitable for C/C++ compilation and as a base image for language runtimes that require a C/C++ compiler for native libraries.

## Feature(s)
* C/C++ compilation
* Contains a `builder` user
* Working directory `/workspace`

## QuickStart 
```bash
docker run -it \
  --user builder \
  -v $(pwd):/workspace \
  andahme/build-essential
```