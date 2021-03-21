#docker run --gpus all -it --shm-size 50G --name SaraCCT -v /home/mousavi:/home/mousavi -v /usb:/usb -v /da1_data:/da1_data -v /data:/data cct /bin/bash
docker run --gpus all -it --shm-size 50G --name VideoTorch -v /home/mousavi:/home/mousavi -v /usb:/usb -v /da1_data:/da1_data -v /data:/data cct /bin/bash
