# andahme/build-essential
This image is suitable for C/C++ compilation and as a base image for language runtimes that require a C/C++ compiler for native libraries.

## QuickStart 
```bash
docker run -it --rm \
  --user builder \
  --volume $(pwd):/workspace \
  andahme/build-essential
```

## Notes

### Feature(s)
* C/C++ compilation
* Contains a `builder` user
* Working directory `/workspace`

### Use Case(s)
* Base Image for Interpreted Language Runtime Images
* Build Image for C/C++ Applications

### Design Consideration(s)
* Contains a "builder" user
  * Allows us to run as non-root
  * Writable home directory so tools will function
* Default workdir at `/workspace`
  * Writable by "everyone"
* No data volumes by default
  * Minimal, does not impose on users without a case
  * Can be accomplished with `--user` and `--volume` flags
  * Processes that write many files should mount a **local directory** or a **docker data volume**


