FROM		debian:buster

RUN		apt update			-y
RUN		apt upgrade			-y
RUN		apt-get install mariadb-server	-y

COPY		conf/mariadb_conf.sh .
RUN		chmod +x mariadb_conf.sh

EXPOSE		3306

ENTRYPOINT	["./mariadb_conf.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]