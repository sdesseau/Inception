PATH_YML = ./srcs/docker-compose.yml
BONUS_PATH_YML = ./srcs/requirements/bonus/docker-compose.yml

all:
	@docker compose up

re: clean all

stop:
	@docker-compose -f $(PATH_YML) stop

bonus_stop:
	@docker-compose -f $(BONUS_PATH_YML) stop

clean: stop
	@docker-compose -f $(PATH_YML) down -v

bonus_clean: bonus_stop
	@docker-compose -f $(PATH_YML) down -v

fclean: clean
		bonus_clean
	docker stop $(docker ps -qa); docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null

bonus:
	@docker-compose -f $(BONUS_PATH_YML) up -d --build