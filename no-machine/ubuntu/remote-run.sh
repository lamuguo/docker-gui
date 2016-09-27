#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 4012:4000 \
  --name nm-ubuntu-1 \
  rvion/nm-ubuntu
