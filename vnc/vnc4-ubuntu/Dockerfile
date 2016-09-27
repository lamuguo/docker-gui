FROM ubuntu
MAINTAINER vion.remi@gmail.com
RUN apt-get update -qq

# avoid prompt questions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install xdm xfce4 xfonts-base xserver-xorg -y
RUN apt-get install vnc4server -y
RUN apt-get install firefox -y
CMD bash
# CMD vnc4server :0
