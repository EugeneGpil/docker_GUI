FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN apt-get update &&\
    \
    echo "Installing text editor with graphic interface" &&\
    apt-get install gedit -y &&\
    \
    echo "Installing xauth. Need this package to authenticate the container to access the X Server" &&\
    apt-get install xauth -y &&\
    \
    echo "Creating .Xuathority file to manage X Server access" &&\
    touch /root/.Xauthority
