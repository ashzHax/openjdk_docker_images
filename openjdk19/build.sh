#!/bin/sh

IMAGE_NAME="openjdk19"
CONTAINER_NAME="jdk19"
SDK_NUM="19"
MNT_POINT="-v /home/ashz/server/Minecraft/:/home/dkr/mnt/"
CONTAINER_PORT="-p 25565:25565"

echo "[!] building new openjdk11 image"

echo "[!] deleting old image + build test containers"
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME

echo "[!] building new image"
docker build -t $IMAGE_NAME .

echo "[!] starting test container"
docker run -it --name $CONTAINER_NAME $MNT_POINT $CONTAINER_PORT $IMAGE_NAME

echo "[!] finished building new image"
