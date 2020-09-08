# Author Tzeng Tzu Hao (how123480)
FROM php:7.3-apache

#copy file to file system
COPY src/ /var/www/html/

#configure
COPY ./conf/apache2.conf /etc/apache2
COPY ./conf/php.ini $PHP_INI_DIR/

RUN a2enmod rewrite;service apache2 restart;

RUN chmod 777 -R /var/www/html/uvdesk-community-v1.0.12/.env;
RUN chmod 777 -R /var/www/html/uvdesk-community-v1.0.12/var;
RUN chmod 777 -R /var/www/html/uvdesk-community-v1.0.12/config;
#clear cache
RUN php /var/www/html/uvdesk-community-v1.0.12/bin/console c:c

# add dependency
RUN pecl install mailparse \
    && docker-php-ext-enable mailparse

RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
# RUN php /var/www/html/uvdesk-community-v1.0.12/bin/console uvdesk:configure-helpdesk

EXPOSE 80

# docker exec -d uvdesk_uvdesk_web_1 sh
