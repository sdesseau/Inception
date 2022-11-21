# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stan <stan@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/19 17:06:54 by stan              #+#    #+#              #
#    Updated: 2022/11/19 17:15:23 by stan             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster

RUN     apt update -y
RUN     apt install -y nginx
RUN     apt install -y openssl

RUN     mkdir -p /etc/nginx/ssl

RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sdesseau.42.fr/UID=sdesseau"

COPY    conf/nginx.conf /etc/nginx/nginx.conf
COPY    conf/index.html /var/www/index.html

RUN     chmod 755 /var/www/html
RUN     chown -R www-data:www-data /var/www/html

CMD     [ "nginx", "-g", "daemon off;" ]