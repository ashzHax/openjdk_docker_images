FROM ubuntu:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update system repository
RUN apt-get update

# for supressing DIALOG errors
# https://github.com/moby/moby/issues/27988#issuecomment-600831315
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y dialog apt-utils

# Java SDK for applications
RUN apt-get update
RUN apt-get install -y \
	openjdk-17-jdk\
	openjdk-17-jre

# nettools 
RUN apt-get update
RUN apt-get install -y net-tools

# getting build tools update 
RUN apt-get update
RUN apt-get install -y git

# for sudo 
RUN apt-get update
RUN apt-get install sudo

# timezone set
# timezone fix: https://dev.to/0xbf/set-timezone-in-your-docker-image-d22
RUN apt-get update
RUN apt-get install -yq tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# for debugging issues
RUN apt-get update
RUN apt-get install -y vim

# add user (to prevent build fails due to root user blocking)
RUN useradd -m dkr && echo "dkr:helloworld" | chpasswd && adduser dkr sudo

# build directory
RUN mkdir -p /home/dkr
RUN chown dkr:dkr /home/dkr -R
RUN mkdir -p /home/dkr/mnt
RUN chown dkr:dkr /home/dkr/mnt -R

# set user's home directory
RUN usermod -d /home/dkr/ dkr


# bashrc configuration
RUN echo "PS0=\"\"" >> /home/dkr/.bashrc
RUN echo "PS1=\"\[\033[97m[\033[96m17\033[97m]\033[97m[\033[91m\u\033[97m]\033[97m[\033[96m\w\033[97m]\033[0m \]\"" >> /home/dkr/.bashrc
RUN echo "PS2=\">\"" >> /home/dkr/.bashrc
RUN echo "PS3=\"\n\"" >> /home/dkr/.bashrc
RUN echo "PS4=\"\n\"" >> /home/dkr/.bashrc

USER dkr
WORKDIR /home/dkr/mnt
