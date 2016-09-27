FROM ubuntu
MAINTAINER vion.remi@gmail.com

# avoid prompt questions
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q

# Install graphical env
RUN apt-get install -y xfce4 xfonts-base xserver-xorg
# RUN apt-get install xdm xfce4 xfonts-base xserver-xorg -y

# install nx compatible drivers:
#   - cups: printing system
#   - pulseaudio: sound system
RUN apt-get install -y apt-utils
RUN apt-get install -y pulseaudio cups

RUN apt-get install -y curl

# install nomachine server
RUN curl \
    -sSL http://download.nomachine.com/download/5.1/Linux/nomachine_5.1.44_1_amd64.deb \
    -o nomachine.deb
RUN dpkg \
    -i nomachine.deb

# Install vscode
RUN apt-get install libgconf2-4 -y
RUN apt-get install libnss3 -y
RUN curl -sSL https://go.microsoft.com/fwlink/\?LinkID\=760868 -o vscode.deb
RUN dpkg -i vscode.deb

# install misc tools
RUN apt-get install -y vim
RUN apt-get install -y htop
RUN apt-get install -y tmux
RUN apt-get install -y git
RUN apt-get install -y nload
RUN apt-get install -y xterm guake
RUN apt-get install -y chromium-browser
RUN apt-get install -y sudo
RUN apt-get install -y zsh

# add rvion user
RUN groupadd \
      --system \
      rvion \
      --gid 433 && \
    useradd \
      --uid 431  \
      --system \
      --gid rvion \
      --home-dir /home/rvion \
      --shell /bin/zsh \
      --comment "NoMachine" \
      rvion && \
    mkdir /home/rvion && \
    chown -R rvion:rvion /home/rvion && \
    echo 'rvion:pass' | chpasswd

# zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /home/rvion/.oh-my-zsh && \
    cp /home/rvion/.oh-my-zsh/templates/zshrc.zsh-template /home/rvion/.zshrc


# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /home/rvion/.fzf
RUN runuser -l rvion -c '/home/rvion/.fzf/install --key-bindings --completion --update-rc'

# WIP
RUN apt-get install -y synapse

# add user to sudoers
RUN sudo usermod -aG sudo rvion
USER rvion
EXPOSE 4000
ADD nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]
