#!/bin/bash

rm -rf lotus
git clone --depth=1 https://github.com/filecoin-project/lotus.git -b master
cd lotus

TAG=$(git rev-parse --short HEAD)
if docker pull textile/lotus:$TAG > /dev/null; then
  echo "Docker image of $TAG already exists, nothing to do."
  exit 0
else
  echo "Building image..."
fi

make deps
cd ..

docker build -t textile/lotus:$TAG -t textile/lotus:latest .
docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD
docker push textile/lotus:$TAG
docker push textile/lotus:latest
