FROM ubuntu
RUN apt-get update -qq
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update -qq

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install x2goserver x2goserver-xsession -y
RUN apt-get install xdm xfce4 xfonts-base xserver-xorg -y

# Add a user with a stupid password, can be improved.
RUN useradd -ms /bin/bash test && \
    echo "test:test123" | chpasswd

ADD start-x2go.sh /
ENTRYPOINT "/start-x2go.sh"

