#!/bin/bash

run="run"
bash="bash"
remove="rm"

name="pt-nb"
#image="tensorflow/tensorflow:latest-gpu-py3-jupyter"
image="cct"

#-u $(id -u ${USER}):$(id -g ${USER}) \
#-p 8888:8888 \

if [ "$1" = "$run" ]; then
  docker run --gpus all -it \
	--shm-size 50G \
	-v /home/zyang37/:/home/zyang37/ \
	-v /da2_data/shared/twitter/:/da2_data/shared/twitter/ \
	-v /home/mousavi:/home/mousavi -v /da1_data:/da1_data -v /data:/data \
	--name "$name" \
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
