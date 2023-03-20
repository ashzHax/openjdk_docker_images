#!/bin/sh

IMAGE_NAME="openjdk8"
CONTAINER_NAME="jdk8"
SDK_NUM="8"
MNT_POINT="-v /home/ashz/server/Minecraft/:/home/dkr/mnt/"
CONTAINER_PORT="-p 25565:25565"

echo "[!] building new openjdk8 image"

echo "[!] deleting old image + build test containers"
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME

echo "[!] building new image"
docker build -t $IMAGE_NAME --no-cache .

echo "[!] starting test container"
docker run -it --name $CONTAINER_NAME $MNT_POINT $CONTAINER_PORT $IMAGE_NAME

echo "[!] finished building new image"
