

docker build -t centos_php .
docker run --net=host -i -t -p 8080:80 -v /data/wwwroot:/data/www centos_php /bin/bash
