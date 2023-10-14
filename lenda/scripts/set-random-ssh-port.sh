#!/bin/bash
RANDOM=$$
sshport=$RANDOM
read -p "Actual port = "$sshport" confirm ?" confirmport
if [[ "$confirmport" == [yY] ]]; then
    portline=$(grep -n "Port 22" /etc/ssh/sshd_config | cut -f1 -d:)
    sed -i "${portline}s/#//" /etc/ssh/sshd_config
    sed -i "${portline}s/22/$sshport/" /etc/ssh/sshd_config
    pubkeyline=$(grep -n "PubkeyAuthentication yes" /etc/ssh/sshd_config | cut -f1 -d:)
    sed -i "${pubkeyline}s/#//" /etc/ssh/sshd_config
    read -p "Paste your private key: " sshkey
    echo "$sshkey" >> /root/.ssh/authorized_keys
    systemctl restart sshd
    service sshd restart
    read -p "Your new ssh port is $sshport" pause
else
    echo value not recognized...
    sleep 2
    echo cancelled...
    sleep 2
fi