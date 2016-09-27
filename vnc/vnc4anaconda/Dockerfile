FROM continuumio/anaconda
MAINTAINER vion.remi@gmail.com

RUN apt-get update -qq

# avoid prompt questions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
#RUN apt-get install xfce4 -y

#RUN apt-get install chromium chromium-l10n -yq
RUN apt-get install vnc4server -y

#vscode dependencies
RUN apt-get install libgconf2-4 -y
RUN apt-get install libnss3 -y
RUN apt-get install libnotify4 -y
RUN apt-get install libgtk2.0-0 -y
# setup vscode
RUN mkdir  $HOME/vscode
RUN  curl \
  -sSL https://go.microsoft.com/fwlink/?LinkID=760868 \
  -o $HOME/vscode/vscode.deb

RUN dpkg -i $HOME/vscode/vscode.deb
# RUN rm vscode.deb

RUN adduser user \
  --gecos "First Last,RoomNumber,Workphone,HomePhone" \
  --disabled-password

CMD bash
