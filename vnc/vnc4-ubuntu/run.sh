#!/bin/bash

docker run -it --rm \
  --privileged \
  -p 5900:5900 \
  -p 5800:5800 \
  --name vnc4-kali-1 \
  vnc4-ubuntu

# vnc4server :0
