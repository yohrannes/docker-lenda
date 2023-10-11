#!/bin/bash
RANDOM=$$
read -p "Actual port = "$RANDOM" confirm ?" confirmport
if [[ "$confirmport" == [yY] ]]; then
    echo "Port $RANDOM" >> /etc/ssh/sshd_config
    systemctl restart sshd
    read -p "Your new ssh port is $RANDOM" pause
else
    echo cancelled...
    sleep 2
fi