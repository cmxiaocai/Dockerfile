#!/bin/bash

mkdir /usr/local/php-5.4.40/etc/ext

#install yaf
cd /data/install/yaf-2.3.3
/usr/local/php-5.4.40/bin/phpize
./configure --with-php-config=/usr/local/php-5.4.40/bin/php-config
make && make install
echo '[yaf]
extension = yaf.so
yaf.environ=local
yaf.cache_config=0
yaf.name_suffix=0
yaf.name_separator="_"
yaf.forward_limit=5
yaf.use_namespace=1
yaf.use_spl_autoload=1
yaf.lowcase_path=1
' > /usr/local/php-5.4.40/etc/ext/yaf.ini

#install redis
cd /data/install/phpredis-develop/
/usr/local/php-5.4.40/bin/phpize
./configure --with-php-config=/usr/local/php-5.4.40/bin/php-config
make && make install
echo '[redis]
extension = redis.so
' > /usr/local/php-5.4.40/etc/ext/redis.ini

#install mongo
cd /data/install/mongo-1.6.7/
/usr/local/php-5.4.40/bin/phpize
./configure --with-php-config=/usr/local/php-5.4.40/bin/php-config
make && make install
echo '[mongo]
extension = mongo.so
' > /usr/local/php-5.4.40/etc/ext/mongo.ini

/usr/local/php-5.4.40/bin/php -m

echo 'install php-extension successfully';

