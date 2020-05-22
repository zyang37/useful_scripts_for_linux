# need daemon.json
# {
#   "graph": "/new path/to/your/docker"
#}

mv daemon.json /etc/docker

sudo service docker stop

# change "/path/to/your/docker"
# sudo rsync -aP /var/lib/docker/ /path/to/your/docker

sudo mv /var/lib/docker /var/lib/docker.old

sudo service docker start

# test before you remove old data
sudo rm -rf /var/lib/docker.old
