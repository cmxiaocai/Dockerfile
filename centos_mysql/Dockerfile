#
FROM centos_base
MAINTAINER xiaocai <miss339742811@163.com>

#
RUN yum -y install ncurses-devel cmake

#install mysql
ADD ./package/mysql-5.5.42.tar.gz /data/install
ADD ./install_mysql.sh /data/install/install_mysql.sh

RUN chmod 755 /data/install/install_mysql.sh
RUN /data/install/install_mysql.sh
