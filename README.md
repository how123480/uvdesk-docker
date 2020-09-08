# uvdesk-docker

## introduction
uvdesk is an open-source ticketing system, and following are github link and document.

github: https://github.com/uvdesk/community-skeleton
doc: https://docs.uvdesk.com

## environment
1. one php7.3 server with uvdesk 
2. one mysql server

## usage:
1. Prepare
```
$mkdir src
```

2. Edit your database configuration in docker-compose.yml
There is a default user, root, with admin privilege. You can change its password and datebase name by edit **MYSQL_ROOT_PASSWORD** and **MYSQL_DATABASE**. If you want to add otehr user, plz refer https://hub.docker.com/_/mysql
4. Download the source code of uvdesk
```
$wget "https://cdn.uvdesk.com/uvdesk/downloads/opensource/uvdesk-community-current-stable.zip" -P ./src

$unzip src/uvdesk-community-current-stable.zip
```

3. Build your docker
```
$docker-compose up -d
```

4. Get into the shell of uvdesk container
```
$docker exec -d uvdesk_uvdesk_web_1 sh
```

5. Prepare your database and installation
```
# in the uvdesk container

$php /var/www/html/uvdesk-community-v1.0.12/bin/console uvdesk:configure-helpdesk
```
6. Following steps can refer the installation guide of uvdesk (step2)
https://docs.uvdesk.com/uvdemo/installation/installation-ubuntu.html
7. Mail service setup
    https://www.uvdesk.com/en/blog/setup-mailbox-uvdesk-open-source-helpdesk/
8. Trouble shooting
    If you encounter some error, you can refer this link
    https://www.uvdesk.com/en/blog/open-source-helpdesk-installation-on-ubuntu-uvdesk/
    
## reference
1. https://github.com/uvdesk/community-skeleton
2. https://docs.uvdesk.com
3. https://www.uvdesk.com/en/blog/open-source-helpdesk-installation-on-ubuntu-uvdesk/
4.   https://www.uvdesk.com/en/blog/setup-mailbox-uvdesk-open-source-helpdesk/
5. https://docs.uvdesk.com/uvdemo/installation/installation-ubuntu.html
6. https://hub.docker.com/_/php
7. https://hub.docker.com/_/mysql