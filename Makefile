build:
	sudo mkdir -p /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb
	sudo chmod 755 /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: down
	docker system prune -af
	sudo rm -rf /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb

restart: down build

re: fclean build

images:
	docker images

networks:
	docker network ls

ps:
	docker ps

.PHONY: build down fclean restart re images networks ps
