all:	up

up:
	@mkdir -p /home/luhumber/data
	@mkdir -p /home/luhumber/data/wordpress
	@mkdir -p /home/luhumber/data/mariadb
	@sudo sh -c 'echo "127.0.0.1 luhumber.42.fr" >> /etc/hosts && echo "Successfully added luhumber.42.fr to /etc/hosts"'
	@docker compose -f ./srcs/docker-compose.yml up --detach

down:
	@docker compose -f ./srcs/docker-compose.yml down

build:
	@docker compose -f srcs/docker-compose.yml up --detach --build

clean:
	@docker stop nginx wordpress mariadb 2>/dev/null || true
	@docker rm nginx wordpress mariadb 2>/dev/null || true
	@docker volume rm db wp 2>/dev/null || true
	@docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	@docker network rm inception_net 2>/dev/null || true
	sudo rm -rf /home/luhumber/data
	@sudo sed -i '/127.0.0.1 luhumber.42.fr/d' /etc/hosts && echo "luhumber.42.fr removed in /etc/hosts"

purge:	down clean
	@docker system prune --all

re: clean all

.PHONY: all up down build clean purge re