FROM ubuntu:20.04
WORKDIR /root

RUN apt-get update -y; apt-get upgrade -y;
RUN apt-get install -y nano wget curl telnet net-tools sudo apt-utils;

# Making needed folders
RUN mkdir downloads
RUN mkdir rep-github

# Installing Github CLI
WORKDIR /root/downloads
RUN curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
RUN type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
RUN sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
RUN sudo apt update
RUN sudo apt install gh -y

WORKDIR /root

# Installing git
RUN sudo apt-get install -y git;

# Installing Docker Engine
RUN curl -fsSL https://get.docker.com | bash

# Installing python and flask
RUN sudo apt-get install -y python3 python3-pip
RUN pip3 install Flask requests
RUN set FLASK_ENV=developmennt
EXPOSE 5000

# installing git
RUN sudo apt-get install -y git;

# Download needed files and prepare

COPY . .
RUN chmod +x /root/scripts/*
WORKDIR /root/downloads
RUN wget https://mega.nz/linux/repo/xUbuntu_20.04/amd64/megacmd-xUbuntu_20.04_amd64.deb

WORKDIR /root

# Installing Mega-CMD

RUN sudo apt install "/root/downloads/megacmd-xUbuntu_20.04_amd64.deb" -y

# Installing TMUX

RUN sudo apt-get install tmux -y

# CMD ["sh", "-c", "exec /sbin/init"]