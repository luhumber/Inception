FROM		debian:bookworm

RUN		apt-get update -y
RUN		apt-get upgrade -y
RUN		apt-get -y install wget
RUN		apt-get install -y php8.2 php-fpm php-mysqli mariadb-client wget curl

EXPOSE		9000

COPY		./conf/www.conf /etc/php/8.2/fpm/pool.d
COPY		./tools /var/www/

RUN		chmod +x /var/www/auto_install.sh

ENTRYPOINT	["/var/www/auto_install.sh"]

CMD		["/usr/sbin/php-fpm8.2", "--nodaemonize"]