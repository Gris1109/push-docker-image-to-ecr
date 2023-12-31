#!/bin/bash

REGION="us-east-1"

aws ecr create-repository 
  --repository-name gris-repo \
  --region $REGION \
  --output text
  

docker build -t helloo-world:latest .

docker run --name gris-container -t -i -p 80:80 helloo-world

docker tag helloo-world:latest 914209118176.dkr.ecr.us-east-1.amazonaws.com/gris-repo

docker login -u AWS -p $(aws ecr get-login-password --region $REGION) 914209118176.dkr.ecr.us-east-1.amazonaws.com/gris-repo

docker push 914209118176.dkr.ecr.us-east-1.amazonaws.com/gris-repo
