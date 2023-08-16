#!/bin/sh

REGISTRY=hub.docker.com
IMAGE_NAME=$REGISTRY/52north/server-landingpage
IMAGE_TAG=latest
IMAGE_NAME_WITH_TAG=$IMAGE_NAME:$IMAGE_TAG

docker build --pull --no-cache -t "$IMAGE_NAME_WITH_TAG" .
docker push "$IMAGE_NAME_WITH_TAG"
