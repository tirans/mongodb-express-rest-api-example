# MongoDB and Express.js REST API sample application

This repository contains the sample application for the [MongoDB and Express.js REST API tutorial](https://www.mongodb.com/languages/express-mongodb-rest-api-tutorial).

## How To Run

1. You can follow the [Getting Started with Atlas](https://docs.atlas.mongodb.com/getting-started/) guide, to learn how to create a free Atlas account, create your first cluster and get your Connection String to the database.
Then, set the Atlas URI connection parameter in `server/.env` to your Connection String:
```
ATLAS_URI=mongodb+srv://<username>:<password>@sandbox.jadwj.mongodb.net/myFirstDatabase?retryWrites=true&w=majority
```
2. Build
   cd project root (mongodb-express-rest-api-example)
   run "./build.sh"
2. Install
    we're installing ingress-nginx and the mongo-app helm charts.
    cd helm folder 
    helm install  my-ingress-nginx ingress-nginx/ingress-nginx --version 4.10.1 -f ingress-nginx-values.yaml
    helm install mongo-app ./mongo-app -f ./mongo-app/values.yaml --debug


## Disclaimer

Use at your own risk; not a supported MongoDB product
