#!/bin/bash

run="run"
bash="back"
remove="rm"
fix_gpu_error="setup"

if [ "$1" = "$run" ]; then
  sudo docker run --gpus all -it --name cuda -v /home/yang/Documents:/home nvidia/cuda bash
elif [ "$1" = "$bash" ]; then
  sudo docker start cuda
  sudo docker exec -it cuda bash
elif [ "$1" = "$remove" ]; then
  sudo docker stop cuda
  sudo docker rm cuda
elif [ "$1" = "$fix_gpu_error" ]; then
  # Add the package repositories
  # https://github.com/NVIDIA/nvidia-docker
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
  curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
  curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
  sudo apt-get update
  sudo systemctl restart docker
else
  echo "Usage: sh $0 run/bash/rm"
fi
