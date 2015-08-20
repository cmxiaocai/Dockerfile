
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
 