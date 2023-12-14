#!/bin/bash
sudo systemctl stop docker
sudo systemctl disable docker
sudo yum remove -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum remove -y docker-ce docker-ce-cli containerd.io
