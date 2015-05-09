#!/bin/bash

cd /data/install/libiconv-1.14
./configure --prefix=/usr/local/libiconv-1.14
make
make install

cd /data/install/libmcrypt-2.5.8
./configure --prefix=/usr/local/libmcrypt-2.5.8
make
make install

#install php
cd /data/install/php-5.4.40
./configure \
    --prefix=/usr/local/php-5.4.40 \
    --with-pear \
    --with-zlib-dir \
    --with-bz2 \
    --with-libxml-dir=/usr \
    --with-gd \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --enable-mbstring \
    --with-mysql \
    --with-mysqli \
    --with-pdo_mysql \
    --with-config-file-path=/usr/local/php-5.4.40/etc \
    --with-config-file-scan-dir=/usr/local/php-5.4.40/etc/ext \
    --with-iconv \
    --disable-ipv6 \
    --enable-static \
    --enable-inline-optimization \
    --enable-sockets \
    --enable-soap \
    --with-openssl \
    --with-gettext \
    --with-curl \
    --enable-fpm \
    --enable-shmop \
    --with-mcrypt=/usr/local/libmcrypt-2.5.8
make
make install

cp php.ini-development /usr/local/php-5.4.40/etc/php.ini
sed -i "s/;date.timezone =/date.timezone = \"Asia\/Shanghai\"/g" /usr/local/php-5.4.40/etc/php.ini
sed -i "s/;error_log = syslog/error_log = \/data\/log\/php_errors.log/g" /usr/local/php-5.4.40/etc/php.ini

cp /usr/local/php-5.4.40/etc/php-fpm.conf.default /usr/local/php-5.4.40/etc/php-fpm.conf
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm

sed -i "s/;pid = run\/php-fpm.pid/pid = run\/php-fpm.pid/g"  /usr/local/php-5.4.40/etc/php-fpm.conf
sed -i "s/;error_log = log\/php-fpm.log/error_log = log\/php-fpm.log/g"  /usr/local/php-5.4.40/etc/php-fpm.conf
sed -i "s/;log_level = notice/log_level = error/g"  /usr/local/php-5.4.40/etc/php-fpm.conf
sed -i "s/user = nobody/user = nobody/g"  /usr/local/php-5.4.40/etc/php-fpm.conf
sed -i "s/group = nobody/group = nobody/g"  /usr/local/php-5.4.40/etc/php-fpm.conf

echo 'server {
    listen       80;
    server_name  localhost;

    location / {
        index index.html index.htm;
        root /data/www/;
    }

    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  /data/www$fastcgi_script_name;
        include        fastcgi_params;
    }

    access_log /data/log/ng.access.log;
    error_log /data/log/ng.error.log;
}' > /usr/local/nginx/conf/vhost/default.conf

echo "install php-5.4.40 successfully."
