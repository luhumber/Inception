FROM		debian:bookworm

RUN		apt update			-y
RUN		apt upgrade			-y
RUN		apt-get install mariadb-server	-y

COPY		conf/mariadb_conf.sh .
RUN		chmod +x mariadb_conf.sh

EXPOSE		3306

CMD ["./mariadb_conf.sh"]