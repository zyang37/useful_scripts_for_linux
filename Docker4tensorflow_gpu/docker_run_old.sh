#!/bin/bash

run="run"
bash="bash"
remove="rm"

name="tf-old"
image="tensorflow/tensorflow:1.14.0-py3-jupyter"

#-u $(id -u ${USER}):$(id -g ${USER}) \

if [ "$1" = "$run" ]; then
  docker run --gpus all -it \
	-p 8888:8888 \
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
