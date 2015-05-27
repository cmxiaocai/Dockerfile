#!/bin/bash

cd /data/install/redis-2.8.19
make
make PREFIX=/usr/local/redis install 
cp redis.conf /usr/local/redis/
sed -i "s/daemonize on/daemonize yes/g" /usr/local/redis/redis.conf
/usr/local/redis/bin/redis-server /usr/local/redis/redis.conf
