#!/bin/bash

 version=$(cat version.txt)


docker stop mongo-app mongodb-app
docker rm mongo-app mongodb-app

docker run -d --name mongodb-app -p 5050:5050 mongodb-app:$version
docker run -d --name mongo-app -p 3000:3000 mongo-app:$version

echo "Containers deployed successfully with version $version"