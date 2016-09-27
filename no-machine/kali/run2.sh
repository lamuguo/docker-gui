#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 4001:4000 \
  rvion/kalibar
