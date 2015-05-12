#!/bin/bash

#yum -y install ncurses-devel cmake

cd /data/install/mysql-5.5.42
cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_DATADIR=/data/mysql \
-DSYSCONFDIR=/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \
-DMYSQL_TCP_PORT=3306 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci
make && make install

groupadd mysql
useradd -g mysql mysql

mkdir /data/mysql
mkdir /var/lib/mysql
mkdir /usr/local/mysql/etc

chown -R mysql:mysql /usr/local/mysql
chown -R mysql:mysql /data/mysql
chown -R mysql:mysql /var/lib/mysql/

/usr/local/mysql/scripts/mysql_install_db --basedir=/usr/local/mysql --datadir=/data/mysql --user=mysql
cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
cp support-files/my-small.cnf /usr/local/mysql/etc/my.cnf
chkconfig mysql on
/etc/init.d/mysql start

echo "PATH=/usr/local/mysql/bin:$PATH
export PATH">>/etc/profile
source /etc/profile

mysqladmin -u root password xiaocai
mysql -uroot -pxiaocai -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'*' IDENTIFIED BY 'xiaocai' WITH GRANT OPTION;"
mysql -uroot -pxiaocai -e "FLUSH PRIVILEGES;"


echo 'successfully.'
