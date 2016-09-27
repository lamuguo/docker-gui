FROM ubuntu
RUN apt-get update -qq
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update -qq

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install x2goserver x2goserver-xsession -y
RUN apt-get install xdm xfce4 xfonts-base xserver-xorg -y

RUN service ssh start
RUN service x2goserver start
CMD bash

CMD bash
