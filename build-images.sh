#!/bin/bash

docker network disconnect boilerplate client-test
docker network disconnect boilerplate server-test
docker network rm boilerplate
docker stop client-test
docker stop server-test
docker rm client-test server-test

#docker build -t boilerplate-server:1.0.0 .
#docker build -t boilerplate-client:1.0.0 client/

docker run -dt -p 5000:5000 -h server-side --name server-test boilerplate-server:1.0.0
docker run -dt -p 3000:3000 -h client-side --name client-test boilerplate-client:1.0.0

docker network create boilerplate
docker network connect boilerplate server-test
docker network connect boilerplate client-test
