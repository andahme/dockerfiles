#!/bin/bash


if [ $1 == "code-server" ]; then
    code-server \
      --auth none \
      --bind-addr 0.0.0.0 --port 8080 \
      --disable-telemetry \
      --user-data-dir /workspace/user \
      --extensions-dir /workspace/ext
else
    exec $@
fi

