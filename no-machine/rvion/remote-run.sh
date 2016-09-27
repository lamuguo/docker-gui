#!/bin/bash

docker run -d \
  --privileged \
  -p 4012:4000 \
  --name nm-ubuntu-1 \
  rvion/nx
