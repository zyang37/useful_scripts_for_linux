# ***Useful Scripts for Linux***

A collection of useful scripts range from installing apps, setting up docker, or building docker images, etc on linux.

## Docker4xx
- Pytorch: Docker4pt
- Tensorflow: Docker4tensorflow_gpu

Inside the container
- Two active ports: 8888 and 6006 (when running Jupiter notebook and tensorboard, can use their default ports inside the container)

Outside the container
- Redirect to ports 8888 and 8889 for Jupiter notebook
- Redirect to ports 6006 and 6007 for tensorboard
