#!/bin/bash

version=$(cat version.txt)


new_version=$(echo "$version + 0.01" | bc)
echo $new_version > version.txt
docker rmi mongo-app:$version 2>/dev/null || true
docker rmi mongodb-app:$version 2>/dev/null || true
docker rmi mongodb-app:latest 2>/dev/null || true
docker rmi mongo-app:latest 2>/dev/null || true



docker build -t mongo-app:$new_version -f Dockerfile-app ./app
docker build -t mongodb-app:$new_version -f Dockerfile-server .
docker build -t mongo-app:latest -f Dockerfile-app ./app
docker build -t mongodb-app:latest -f Dockerfile-server .

echo "Images built successfully with version $new_version & latest tags"