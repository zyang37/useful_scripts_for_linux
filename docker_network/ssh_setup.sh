#!/bin/bash

# before running this script, run "ssh-keygen"

echo 'root:root' | chpasswd

sed -i'' -e's/^#PermitRootLogin prohibit-password$/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& sed -i'' -e's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config \
	&& sed -i'' -e's/^#PermitEmptyPasswords no$/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
	&& sed -i'' -e's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

service ssh restart

/usr/sbin/sshd -D

cat /root/.ssh/id_rsa.pub  >> /home/znyang/.ssh/authorized_keys

cp /home/znyang/.ssh/authorized_keys /root/.ssh/

# hostname
hostname -I

container_ip=$(hostname -I )

#chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

echo "docker ssh setup done!"
echo ""
echo "try:"
echo "ssh root@"$container_ip
