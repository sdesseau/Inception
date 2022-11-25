# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdesseau <sdesseau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/25 18:17:34 by sdesseau          #+#    #+#              #
#    Updated: 2022/11/25 18:17:35 by sdesseau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster

RUN     apt update -y
RUN     apt install -y mariadb-server

COPY    conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY    conf/config.sh /config.sh

ENTRYPOINT ["bash", "config.sh"]

EXPOSE  3306