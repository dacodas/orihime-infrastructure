FROM mysql/mysql-server

# Make Japanese locale for this image as well so that that shit works

# RUN yum -y update
RUN yum -y install glibc-common
ENV LANG=ja_JP.UTF-8

RUN sed -i -e 's@datadir=/var/lib/mysql@datadir=/var/lib/mysql-volume@' /etc/my.cnf

EXPOSE 3306 33060
CMD ["mysqld"]
