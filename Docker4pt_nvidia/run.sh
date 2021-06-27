docker run --gpus all -it \
    --shm-size 50G --name pt-nb \
    -v /home/mousavi:/home/mousavi \
    -v /home/zyang37:/home/zyang37 \
    -v /da1_data:/da1_data \
    -v /data:/data pt \
    /bin/bash
