#
FROM centos_nginx
MAINTAINER xiaocai <miss339742811@163.com>

RUN groupadd worker
RUN useradd -g worker worker

#install nginx
ADD ./configure_nginx.sh /data/install/configure_nginx.sh
ADD ./package/composer.phar /data/install/composer.phar

RUN chmod 755 /data/install/configure_nginx.sh
RUN /data/install/configure_nginx.sh
RUN rm -rf /data/install/

RUN echo "alias php=/usr/local/php-5.4.40/bin/php" >> ~/.bash_profile
RUN echo "alias composer=/data/install/composer.phar" >> ~/.bash_profile
RUN echo "export PATH=/usr/local/php-5.4.40/bin:$PATH" >> ~/.bash_profile
RUN source ~/.bash_profile

USER worker
EXPOSE 80

CMD ["/etc/init.d/php-fpm start","/etc/init.d/nginx start"]
