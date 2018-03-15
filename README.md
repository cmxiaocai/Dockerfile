## docker基础镜像构建脚本源码


**1.  image: centos_base**

> 基于官方centos:centos6镜像,通过yum安装基础编译环境和常用工具。其他几个镜像都依赖它。

```shell
yum install -y tar wget gcc gcc-c++ libxml2-devel zlib-devel bzip2-devel curl-devel libjpeg-devel libpng-devel libtiff-devel freetype-devel openssl openssl-devel vim
```

> build:

```shell
docker pull centos:centos6
docker build -t centos_base .
docker run --net=host -i -t centos_base /bin/bash
```

**2. image: centos_develop-php**

> php开发环境,需要先创建centos_base基础镜像
> 含以下服务:

 * nginx-1.5.7
 * php-5.4.40
 * php-extension:yaf-2.3.3
 * php-extension:phpredis-2.2.7
 * php-extension:mongo-1.6.7

> build:

```shell
    docker build -t centos_nginx .
    docker run --net=host -i -t -v /data/wwwroot:/data/www centos_nginx /data/start.sh
```

**3. image: centos_develop-yaf**

> yaf开发环境,需要先创建centos_nginx基础镜像

> build:

```shell
docker build -t centos_yaf .
docker run --net=host -i -t -v /data/wwwroot/github_yaf-phpframe/:/data/www centos_yaf /data/start.sh
```

**4. image: centos_mysql**

> mysql镜像,需要先创建centos_base基础镜像

> build:

```shell
docker build -t centos_mysql .
docker run -i -t -p 8306:3306 centos_mysql /data/start.sh

/usr/local/mysql/bin/mysql -uroot -pxiaocai
show databases;
```


**5. image: centos_redis**

> redis镜像,需要先创建centos_base基础镜像

> build:

```shell
docker build -t centos_mysql .
docker run -i -t -p 8379:6379 centos_mysql /data/start.sh
```

