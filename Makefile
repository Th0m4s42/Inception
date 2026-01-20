all:
	sudo mkdir -p /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb
	sudo chmod 755 /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af
	sudo rm -rf /home/thbasse/data /home/thbasse/data/wordpress /home/thbasse/data/mariadb

re: fclean all

images:
	docker images

networks:
	docker network ls

ps:
	docker ps

.PHONY: all clean fclean re image networks ps
