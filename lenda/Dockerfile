FROM centos
WORKDIR /root

# Preparing system
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y; yum upgrade -y;
RUN yum install -y nano sudo wget curl epel-release telnet;
RUN sudo dnf install dnf -y
RUN sudo dnf update -y
RUN sudo dnf install net-tools -y
RUN yum install -y passwd

# Making needed folders
RUN mkdir downloads
RUN mkdir rep-github

# Installing Github CLI
RUN VERSION=`curl  "https://api.github.com/repos/cli/cli/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-`; wget https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz /root/downloads; tar xvf gh_${VERSION}_linux_amd64.tar.gz; sudo cp gh_${VERSION}_linux_amd64/bin/gh /usr/local/bin/

WORKDIR /root

# Installing Docker Engine
RUN sudo yum install -y yum-utils device-mapper-persistent-data lvm2
RUN sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN sudo yum install -y docker-ce docker-ce-cli containerd.io

# Installing git
RUN sudo yum install -y git;

# Installing python and flask
RUN yum install gcc openssl-devel bzip2-devel libffi-devel -y
RUN sudo yum install -y python3 python3-pip
RUN pip3 install Flask requests
RUN set FLASK_ENV=developmennt

COPY . .

# Download needed files
RUN wget -P /root/downloads https://mega.nz/linux/repo/CentOS_8/x86_64/megacmd-CentOS_8.x86_64.rpm
WORKDIR /root/rep-github
RUN git clone https://github.com/yohrannes/website-portifolio.git
RUN chmod +x website-portifolio/app.py
WORKDIR /root

# Installing Mega-CMD

RUN sudo dnf install -y "/root/downloads/megacmd-CentOS_8.x86_64.rpm"
