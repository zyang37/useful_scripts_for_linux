# Setup ssh in docker
- Able to ssh into docker container from the same server (without password)
    - local ssh
    - ssh from a container

This can be useful for multi-node DNN training, where each node is a docker container.

#### Step 1: run `ssh-keygen`

#### Step 2: run `bash setup_ssh.sh` to setup ssh in docker

#### Step 3: copy and paste the public key to `~/.ssh/authorized_keys` in the docker container. 

You can get ip by running this `hostname -i`. 

# Setup ssh in docker (across different servers!)

This can useful for large scale DNN training across multiple servers. 

#### Step 1: run `ssh-keygen`

#### Step 2: run `bash setup_ssh.sh` to setup ssh in docker

#### Step 3: copy and paste the public key to `~/.ssh/authorized_keys` in the docker container.

#### Step 4: Update docker run

Example: 
```
docker run --gpus all -id --ipc=host --network=host \
    -v /data:/data \
    -v /dev/infiniband:/dev/infiniband \
    --privileged \
    --name <container_name> \
    pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
```

This is different from existing containers as the followings:
- It uses host network namespace, meaning basically it shares networks with the host. All host network interfaces are shown in containers as well. Of course, share the host IP address.
- It mounts `/dev/infiniband` to allow you to access Infiniband devices. Also, IPC namespace is shared for this purpose.

Example: 

Because it shares the network namespace, you need to change the port of container ssh server to another one in /etc/ssh/sshd_config in container. I am using 10000. 
- `ssh insujang@ampere03.eecs.umich.edu` -> Getting to the host
- `ssh insujang@ampere03.eecs.umich.edu -p 10000` -> Getting to the container