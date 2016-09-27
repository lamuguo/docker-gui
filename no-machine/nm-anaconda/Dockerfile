FROM continuumio/anaconda
MAINTAINER vion.remi@gmail.com

# avoid prompt questions
ENV DEBIAN_FRONTEND noninteractive

# update package list
RUN apt-get update -qq

# Install graphical env + helper tools and packages
RUN apt-get update && apt-get install -y vim xterm pulseaudio cups
RUN apt-get install xdm xfce4 xfonts-base xserver-xorg -y
RUN apt-get install -y wget

#vscode dependencies
RUN apt-get install libgconf2-4 -y
RUN apt-get install libnss3 -y
RUN apt-get install curl -y

RUN curl -sSL https://go.microsoft.com/fwlink/\?LinkID\=760868 -o vscode.deb
RUN dpkg -i vscode.deb

# install nomachine server
RUN curl -sSL http://download.nomachine.com/download/5.1/Linux/nomachine_5.1.44_1_amd64.deb -o nomachine.deb
RUN dpkg -i nomachine.deb

# add nomachine user
RUN groupadd -r nomachine -g 433 && \
  useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine && \
  mkdir /home/nomachine && \
  chown -R nomachine:nomachine /home/nomachine && \
  echo 'nomachine:nomachine' | chpasswd

EXPOSE 4000
ADD nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]

# CMD bash
# CMD vnc4server :0

# Dockerfile to install NoMachine Workstation Evaluation v. 4 with MATE interface
# FROM debian:jessie
# ENV DEBIAN_FRONTEND=noninteractive

# ADD nomachine-workstation-evaluation_4.6.22_2_amd64.deb /
# RUN dpkg -i /nomachine-workstation-evaluation_4.6.22_2_amd64.deb

# RUN groupadd -r nomachine -g 433 && \
#   useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine && \
#   mkdir /home/nomachine && \
#   chown -R nomachine:nomachine /home/nomachine && \
#   echo 'nomachine:nomachine' | chpasswd
