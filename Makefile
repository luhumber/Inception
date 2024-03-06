all: volumes build up

build:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env build

up:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d

stop:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env stop
volumes:
		sudo mkdir -p /home/luhumber/data/wordpress
		sudo mkdir -p /home/luhumber/data/mariadb

fclean:
		sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans 
		sudo rm -rf /home/luhumber/data/wordpress
		sudo rm -rf /home/luhumber/data/mariadb

rebuild:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env build --no-cache

re: fclean rebuild all

.PHONY: all build rebuild stop stop volumes fclean