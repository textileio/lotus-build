#!/bin/bash

rm -rf lotus
git clone https://github.com/filecoin-project/lotus.git
cd lotus
git checkout v1.8.0

TAG=$(git rev-parse --short HEAD)
if docker pull textile/lotus:$TAG > /dev/null; then
  echo "Docker image of $TAG already exists, nothing to do."
  echo "Doing things anyway..."
  #exit 0
else
  echo "Building image..."
fi
TAG_VERSIONED=$(git describe --exact-match HEAD)

RUSTFLAGS="-C target-cpu=native" FFI_BUILD_FROM_SOURCE=1 make deps
cd ..

docker build -t textile/lotus:$TAG -t textile/lotus:latest .
docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD
docker push textile/lotus:$TAG
docker push textile/lotus:latest

echo $TAG_VERSIONED
if [ -n "$TAG_VERSIONED" ]
then
  docker build -t textile/lotus:$TAG_VERSIONED .
  docker push textile/lotus:$TAG_VERSIONED
fi
