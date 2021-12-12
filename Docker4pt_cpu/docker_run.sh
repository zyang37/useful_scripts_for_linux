#!/bin/bash

# This script will run a docker container as current user

run="run"
bash="bash"
remove="rm"

name="pt-cpu-nb"
image="pt-cpu-z"
user=$(whoami)

#-u $(id -u ${USER}):$(id -g ${USER}) \

if [ "$1" = "$run" ]; then
  docker run -it --ipc=host --user "$user" \
	-p 8888:8888 \
	-p 6006:6006 \
	-v /home/zyang37/:/home/zyang37/ \
	-v /da2_data/shared/twitter/:/da2_data/shared/twitter/ \
	-v /home/mousavi:/home/mousavi \
	-v /da1_data:/da1_data \
	-v /data:/data \
	-v /usb:/usb \
	--name "$name" --link dbNew:dbNew \
	"$image" \
	/bin/bash

elif [ "$1" = "$bash" ]; then
  docker start "$name"
  docker exec -it "$name" /bin/bash

elif [ "$1" = "$remove" ]; then
  docker stop "$name"
  docker rm "$name"

else
  echo "Usage: sh $0 <run / bash / rm>"
fi
