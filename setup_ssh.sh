#!/bin/bash

sudo apt update
sudo apt install openssh-server

# check
# sudo systemctl status ssh

sudo ufw allow ssh

# check ip
# ip a
# ip_addr/24....

# stop ssh
# sudo systemctl stop ssh

# restart ssh
# sudo systemctl start ssh

# disable/enable the SSH service to start during system boot run
# sudo systemctl disable ssh
# sudo systemctl enable ssh

# get public ip address
# https://ifconfig.co/ip
