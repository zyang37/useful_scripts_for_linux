#!/bin/bash

run="run"
bash="back"
remove="rm"
fix_gpu_error="gpu"

if [ "$1" = "$run" ]; then
  sudo docker run --gpus all -it --name cuda -v /home/yang/Documents:/home nvidia/cuda bash
elif [ "$1" = "$back" ]; then
  sudo docker start cuda
  sudo docker exec -it cuda bash
elif [ "$1" = "$remove" ]; then
  sudo docker stop cuda
  sudo docker rm cuda
elif [ "$1" = "$fix_gpu_error" ]; then
  sudo apt-get update
  sudo apt-get install -y nvidia-container-toolkit
  sudo systemctl restart docker
else
  echo "Usage: sh $0 run/bash/rm"
fi
