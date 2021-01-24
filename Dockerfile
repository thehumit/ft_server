FROM debian:buster
RUN apt update
RUN apt-get install -y php php-fpm php-mysql
RUN apt-get install -y mariadb-server
RUN apt-get install -y wget
RUN apt-get install -y nginx

COPY srcs/db_settings ./
COPY srcs/autoindex_on.sh ./
COPY srcs/autoindex_off.sh ./

COPY srcs/wp-config.php ./
COPY srcs/domain.com.conf ./
COPY srcs/nginx-selfsigned.crt ./etc/nginx/
COPY srcs/nginx-selfsigned.key ./etc/nginx/
COPY srcs/start.sh ./

ENTRYPOINT bash start.sh
