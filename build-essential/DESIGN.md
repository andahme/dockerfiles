## Use Case(s)

1. Base Image for Interpreted Runtime Image(s)

2. Build Image for C/C++ Applications


## Design Consideration(s)

* Contains a "builder" user
    * Allows us to run as non-root
    * Writable home directory so tools will function

* Default workdir at `/workspace`
    * Writable by "everyone"

* No data volumes by default
    * Minimal, does not impose on users without a case
    * Can be accomplished with `--user` and `--volume` flags
    * Processes that write many files should mount a **local directory** or a **docker data volume**


