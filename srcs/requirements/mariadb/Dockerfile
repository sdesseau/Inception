FROM    debian:buster

RUN     apt update -y
RUN      apt install -y mariadb-server
RUN      apt install -y vim
RUN      apt install -y curl
RUN      apt install -y man

COPY    conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/config.sh /config.sh

# ENTRYPOINT ["bash", "config.sh"]

EXPOSE 3306