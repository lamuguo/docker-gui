#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 22:22 \
  x2go-kali

# vnc4server :0
