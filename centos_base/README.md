

> 基于官方centos:centos6镜像,通过yum安装基础编译环境和常用工具。

```
yum install -y tar wget gcc gcc-c++ libxml2-devel zlib-devel bzip2-devel curl-devel libjpeg-devel libpng-devel libtiff-devel freetype-devel openssl openssl-devel vim
```

## pull centos:centos6

> 安装docker后pull官方镜像

```
    yum install docker-io
    service docker start
    chkconfig docker on
    docker pull centos:centos6
    docker images
```


> pull太慢可以试试国内镜像:

 * docker pull dl.dockerpool.com:5000/centos:6
 * http://dockerpool.com/

## docker build

```
    docker build -t centos_base .
    docker images
    docker run --net=host -i -t centos_base /bin/bash
```

## docker commit

```
    #把容器提交生成最新的镜像
    docker commit ce4a6d151ced centos_base
```

