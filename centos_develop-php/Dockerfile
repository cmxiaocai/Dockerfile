#
FROM centos_base
MAINTAINER xiaocai <miss339742811@163.com>

#install nginx
ADD ./package/nginx-1.5.7.tar.gz /data/install/
ADD ./install_nginx.sh /data/install/install_nginx.sh

RUN chmod 755 /data/install/install_nginx.sh
RUN /data/install/install_nginx.sh

#install php
ADD ./package/php-5.4.40.tar.gz /data/install/
ADD ./package/libiconv-1.14.tar.gz /data/install/
ADD ./package/libmcrypt-2.5.8.tar.gz /data/install/
ADD ./package/yaf-2.3.3.tgz /data/install/
ADD ./package/phpredis-develop.tar.gz /data/install/
ADD ./install_php.sh /data/install/install_php.sh
RUN chmod 755 /data/install/install_php.sh
RUN /data/install/install_php.sh

#
#RUN /etc/init.d/iptables stop
#RUN /etc/init.d/nginx start
#RUN /etc/init.d/php-fpm start
RUN rm -rf /data/install/php-5.4.40
RUN rm -rf /data/install/nginx-1.5.7
RUN rm -rf /data/install/libiconv-1.14
RUN rm -rf /data/install/libmcrypt-2.5.8

EXPOSE 80

#CMD ["/etc/init.d/iptables stop","/etc/init.d/nginx start"]
