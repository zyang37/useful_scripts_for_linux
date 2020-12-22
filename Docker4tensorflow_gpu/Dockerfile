FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

ENV DEBIAN_FRONTEND=nonintercative

RUN apt-get update
RUN apt-get update && apt-get install -q -y \
  wget \
  vim \
  git \
  python3-opencv \
  cython3 \
  build-essential


RUN echo "mousavi:x:4477:" >> /etc/group
RUN echo "mousavi:x:25044:4477:Sara Mousavi,620,,:/home/mousavi:/bin/bash" >> /etc/passwd

RUN echo "zyang37:x:3944:" >> /etc/group
RUN echo "zyang37:x:26388:3944:Zhenning Yang,620,,:/home/zyang37:/bin/bash" >> /etc/passwd

WORKDIR "/root"
CMD ["/bin/bash"]

#python3 setup.py install

#to install opencv for python3
RUN apt-get install python3-opencv
#for this some inputs are needed
RUN pip3 install notebook
