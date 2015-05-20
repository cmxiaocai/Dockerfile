#!/bin/bash

rm -rf /usr/local/nginx/conf/vhost/default.conf
echo '
server {
    listen       8001;
    server_name  xiaocai.loc;

    location / {
        index index.php index.html index.htm;
        root /data/www/webroot/;
    }

	location ~ \.php$ {
		root /data/www/webroot/;
		fastcgi_pass  127.0.0.1:9000;
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME /data/www/webroot/$fastcgi_script_name;
		include       fastcgi_params;
	}
	
	if (!-e $request_filename) {
		rewrite ^/(.*) /index.php?$1 last;
	}
	
    access_log /data/log/ng.access.log;
    error_log /data/log/ng.error.log;
}
' > /usr/local/nginx/conf/vhost/yaf.conf


echo "successfully."

