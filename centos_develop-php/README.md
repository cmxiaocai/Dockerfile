
PHP开发环境镜像
==================

需要先创建centos_base基础镜像
 * nginx-1.5.7
 * php-5.4.40
 * yaf-2.3.3
 * phpredis-2.2.7
 * mongo-1.6.7

--
    docker build -t centos_nginx .
    docker run --net=host -i -t -v /data/wwwroot:/data/www centos_nginx /data/start.sh
--

> 下载地址

    http://mirrors.sohu.com/nginx/nginx-1.5.7.tar.gz
    http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
    https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz/download
    http://cn2.php.net/get/php-5.4.40.tar.gz/from/this/mirror
 
