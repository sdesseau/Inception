# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdesseau <sdesseau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/25 18:18:19 by sdesseau          #+#    #+#              #
#    Updated: 2022/11/25 18:18:20 by sdesseau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
	@sudo docker compose -f $(BONUS_PATH_YML) down -v

fclean: clean
	@sudo docker system prune -af

bonus_fclean: bonus_clean
	@sudo docker system prune -af

bonus:
	@sudo docker compose -f $(BONUS_PATH_YML) up -d --build