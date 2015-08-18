#!/bin/bash

/etc/init.d/mysql start
netstat -an | grep LISTEN | grep 3306

/bin/bash
