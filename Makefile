PATH_YML = ./srcs/docker-compose.yml
BONUS_PATH_YML = ./srcs/requirements/bonus/docker-compose.yml

all:
	@sudo docker compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker compose -f $(PATH_YML) stop

bonus_stop:
	@sudo docker compose -f $(BONUS_PATH_YML) stop

clean: stop
	@sudo docker compose -f $(PATH_YML) down -v

bonus_clean: bonus_stop
	@sudo docker compose -f $(PATH_YML) down -v

fclean: clean
		bonus_clean
	docker stop $(docker ps -qa); docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null

bonus:
	@sudo docker compose -f $(BONUS_PATH_YML) up -d --build