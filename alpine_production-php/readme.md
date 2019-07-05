
## 部署

> 构建镜像

```
docker build -t alpine_php .
```

> 启动容器

```
cd {your_directory}
docker run --rm -v $(pwd):/app composer install
docker run --name=alpine_php -d -p 8080:80 -v $(pwd):/home/wwwroot/ wn-habibi
```

> 日志位置

```
storage/logs/nginx_error.log
storage/logs/access_error.log
storage/logs/php-fpm.log
storage/logs/php_error.log
storage/logs/php_access.log
storage/logs/php_slow.log
```

