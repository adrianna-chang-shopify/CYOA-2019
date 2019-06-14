#!/bin/sh
export PATH=$PATH:~/.bin/
cd hello-webapp
docker build -t hello-webapp:v1
docker run -d -p 80:8080 hello-webapp:v1
export REGISTRY="$(2886795285-5000-cykoria03.environments.katacoda.com)"
docker tag hello-webapp:v1 $REGISTRY/hello-webapp:v1
docker push $REGISTRY/hello-webapp:v1
sed -i -e 's@IMAGE_URL@'"$REGISTRY/hello-webapp:v1"'@' deployment.yaml
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@host01:/root/.kube/config ~/.kube/
kubectl apply -f deployment.yaml
