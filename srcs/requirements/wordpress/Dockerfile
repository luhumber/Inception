FROM		debian:buster

RUN		apt-get update -y
RUN		apt-get upgrade -y
RUN		apt-get -y install wget
RUN		apt-get install -y php7.3 php-fpm php-mysqli mariadb-client wget curl

EXPOSE		9000

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY		./tools /var/www/

RUN		chmod +x /var/www/auto_install.sh
ENTRYPOINT	["/var/www/auto_install.sh"]

CMD		["/usr/sbin/php-fpm7.3", "--nodaemonize"]