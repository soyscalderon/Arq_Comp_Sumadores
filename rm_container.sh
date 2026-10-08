#!//usr/bin/bash
IMAGE_NAME="arq-comp-sumadores"
docker stop "$IMAGE_NAME" && docker rm "$IMAGE_NAME" -v