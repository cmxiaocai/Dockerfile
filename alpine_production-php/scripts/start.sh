#!/bin/bash

# Update nginx to match worker_processes to no. of cpu's
procs=$(cat /proc/cpuinfo |grep processor | wc -l)
sed -i -e "s/worker_processes  auto/worker_processes $procs/" /etc/nginx/nginx.conf

# Always chown webroot for better mounting
chown -Rf nginx.nginx /usr/share/nginx/html

# Start Build
# cd /home/wwwroot/
# composer install

mkdir -p /home/wwwroot/storage/logs

# Start supervisord and services
exec /usr/bin/supervisord -n -c /etc/supervisord.conf