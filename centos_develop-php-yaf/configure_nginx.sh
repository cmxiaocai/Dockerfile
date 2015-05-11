#!/bin/bash

cd /data/install/nginx-1.5.7
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_gzip_static_module 
make 
make install

mkdir /data/log
mkdir /usr/local/nginx/conf/vhost
echo '
server {
    listen       80;
    server_name  localhost;

    location / {
        index index.html index.htm;
        root /data/www/;
    }

    access_log /data/log/ng.access.log;
    error_log /data/log/ng.error.log;
}
' > /usr/local/nginx/conf/vhost/default.conf

echo '
user  nobody;
worker_processes  1;
#pid        logs/nginx.pid;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    include /usr/local/nginx/conf/vhost/*.conf;
}
' > /usr/local/nginx/conf/nginx.conf

echo '#!/bin/sh
DESC="nginx daemon"
NAME=nginx
DAEMON=/usr/local/nginx/sbin/$NAME
CONFIGFILE=/usr/local/nginx/conf/$NAME.conf
PIDFILE=/usr/local/nginx/logs/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

set -e
[ -x "$DAEMON" ] || exit 0

do_start() {
    $DAEMON -c $CONFIGFILE || echo -n "nginx already running"
}

do_stop() {
    kill -INT `cat $PIDFILE` || echo -n "nginx not running"
}

do_reload() {
    kill -HUP `cat $PIDFILE` || echo -n "nginx can not reload"
}

case "$1" in
    start)
    echo -n "Starting $DESC: $NAME"
    do_start
    echo "."
    ;;
stop)
    echo -n "Stopping $DESC: $NAME"
    do_stop
    echo "."
    ;;
reload|graceful)
    echo -n "Reloading $DESC configuration..."
    do_reload
    echo "."
    ;;
restart)
    echo -n "Restarting $DESC: $NAME"
    do_stop
    do_start
    echo "."
    ;;
*)
    echo "Usage: $SCRIPTNAME {start|stop|reload|restart}" >&2
    exit 3
    ;;
esac
exit 0
' > /etc/init.d/nginx
chmod +x /etc/init.d/nginx

rm -rf /data/install/nginx-1.5.7
echo "install nginx-1.5.7 successfully."

