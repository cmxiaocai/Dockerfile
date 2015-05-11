centos_base
==================

基于官方centos:centos6镜像,通过yum安装基础编译环境和常用工具。

--
    yum install -y tar wget gcc gcc-c++ libxml2-devel zlib-devel bzip2-devel curl-devel libjpeg-devel libpng-devel libtiff-devel freetype-devel openssl openssl-devel vim
--

--
    yum install docker-io
    service docker start
    chkconfig docker on
    docker pull centos:centos6
    docker images
	
	docker build -t centos_base .
    docker images
    docker run --net=host -i -t centos_base /bin/bash
--

centos_develop-php
==================

php开发环境,需要先创建centos_base基础镜像
 * nginx-1.5.7
 * php-5.4.40
 * yaf-2.3.3
 * phpredis-2.2.7
 * mongo-1.6.7

--
    docker build -t centos_nginx .
    docker run --net=host -i -t -p 8080:80 -v /data/wwwroot:/data/www centos_nginx /bin/bash
--

centos_develop-yaf
==================

yaf开发环境,需要先创建centos_nginx基础镜像

--
    docker build -t centos_yaf .
    docker run --net=host -i -t -v /data/wwwroot/github_yaf-phpframe/:/data/www centos_yaf
--
