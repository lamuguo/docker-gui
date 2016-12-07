#!/bin/sh

service ssh start
service x2goserver start

# to keep running with exit.
tail -f /var/log/dmesg
