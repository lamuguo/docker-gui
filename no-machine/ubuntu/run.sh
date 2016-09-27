#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 4001:4000 \
  --name nm-ubuntu-1 \
  nm-ubuntu
