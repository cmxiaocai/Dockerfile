#
FROM centos_nginx
MAINTAINER xiaocai <miss339742811@163.com>

#install nginx
ADD ./configure_nginx.sh /data/install/configure_nginx.sh

RUN chmod 755 /data/install/configure_nginx.sh
RUN /data/install/configure_nginx.sh
RUN rm -rf /data/install/

EXPOSE 80

CMD ["/etc/init.d/php-fpm start","/etc/init.d/nginx start"]