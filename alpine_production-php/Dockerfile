FROM richarvey/nginx-php-fpm:1.5.1

MAINTAINER xiaocai "cmxiaocai@163.com"

USER root

# extension init
RUN mkdir -p /usr/src/php/ext
RUN docker-php-ext-install bcmath

# install extension redis
ADD package/phpredis-3.1.3.tar.gz /tmp/
RUN mv /tmp/phpredis-3.1.3 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

# install extension yaf
ADD package/yaf-3.0.7.tgz /tmp/
RUN mv /tmp/yaf-3.0.7 /usr/src/php/ext/yaf \
    && docker-php-ext-install yaf

# install librdkafka
RUN apk add --no-cache gcc g++
RUN apk add --no-cache librdkafka-dev

# install extension rdkafka
ADD package/rdkafka-3.1.0.tar.gz /tmp/
RUN mv /tmp/php-rdkafka-3.1.0 /usr/src/php/ext/rdkafka \
    && docker-php-ext-install rdkafka

# extension check
RUN php --ini

# install filebeat
RUN apk add --no-cache libc6-compat
ADD package/filebeat-6.5.4-linux-x86_64.tar.gz /tmp/
RUN cp /tmp/filebeat-6.5.4-linux-x86_64/filebeat /bin/filebeat \
    && chmod +x /bin/filebeat

# clean up install
RUN rm -rf /usr/src/php && \
    rm -rf /pecl && \
    rm -rf /tmp/filebeat*

# configuration
ADD conf/php-fpm.conf /usr/local/etc/php-fpm.conf
ADD conf/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD conf/yaf.ini /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini
ADD conf/docker-vars.ini /usr/local/etc/php/conf.d/docker-vars.ini
ADD conf/nginx-site.conf /etc/nginx/sites-available/default.conf
ADD conf/nginx-site-ssl.conf /etc/nginx/sites-available/default-ssl.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/supervisord.conf /etc/supervisord.conf
ADD conf/filebeat.yml /etc/filebeat.yml
ADD scripts/start.sh /start.sh
RUN chmod +x /start.sh

# php check
RUN php -m && php -v

EXPOSE 443 80

CMD ["/start.sh"]