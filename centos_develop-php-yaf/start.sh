#!/bin/bash

/etc/init.d/iptables stop
/etc/init.d/nginx start
/etc/init.d/php-fpm start

/bin/bash
