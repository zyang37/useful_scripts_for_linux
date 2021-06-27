# FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime

ENV DEBIAN_FRONTEND=nonintercative

RUN apt-get update
RUN apt-get update && apt-get install -y \
    git \
    vim \
    wget \
    curl \
    cmake \
    build-essential

RUN pip install notebook
RUN apt update
RUN apt install -y libgl1-mesa-glx
RUN apt-get install -y libgtk2.0-dev

RUN pip install opencv-python
RUN pip install scipy
RUN pip install tqdm 
RUN pip install matplotlib


RUN echo "mousavi:x:4477:" >> /etc/group
RUN echo "mousavi:x:25044:4477:Sara Mousavi,620,,:/home/mousavi:/bin/bash" >> /etc/passwd

RUN echo "zyang37:x:3944:" >> /etc/group
RUN echo "zyang37:x:26388:3944:Zhenning Yang,620,,:/home/zyang37:/bin/bash" >> /etc/passwd

WORKDIR "/root"
CMD ["/bin/bash"]

