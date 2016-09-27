#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 2222:22 \
  -p 5900:5900 \
  -p 5800:5800 \
  --name x2go-xfce-1 \
  x2go-xfce

# vnc4server :0
