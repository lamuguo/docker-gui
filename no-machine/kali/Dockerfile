FROM kalilinux/kali-linux-docker
MAINTAINER vion.remi@gmail.com

# avoid prompt questions
ENV DEBIAN_FRONTEND noninteractive

# update package list
RUN apt-get update -qq

# Install graphical env + helper tools and packages
RUN apt-get update && apt-get install -y vim xterm pulseaudio cups
# RUN apt-get install -y  mate-desktop-environment-core
RUN apt-get install -y wget

# install nomachine server
ADD nomachine_5.1.44_1_amd64.deb /
RUN dpkg -i /nomachine_5.1.44_1_amd64.deb

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
