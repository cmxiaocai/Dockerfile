
#install docker

yum install docker-io

service docker start

chkconfig docker on

docker pull centos:centos6

docker images

#docker build

docker build -t centos_base .

docker images

docker run --net=host -i -t centos_base /bin/bash

