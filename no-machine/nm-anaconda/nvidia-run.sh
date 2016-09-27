#!/bin/bash

nvidia-docker run -it --rm \
  --privileged \
  -p 4002:4000 \
  --name nm-anaconda-1 \
  nm-anaconda
