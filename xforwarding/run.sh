#! /bin/bash

set -e

docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $1:/app \
  --workdir /app \
  --name="vscode" \
  vscode-anaconda \
  bash
