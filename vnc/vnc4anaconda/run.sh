#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 5900:5900 \
  -p 5800:5800 \
  vnc4anaconda

# vnc4server :0
