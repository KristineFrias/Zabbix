# zabbixtest

Installs and configure zabbix server from packages available from Zabbix SIA official packages.

Supported Platforms
Ubuntu 16.04

Zabbix Version: 
Zabbix 4.0-2

Recipes:
default
Run setup_repository, server_mysql, php_frontend recipes, and optionally configures database and webserver if attributes node['zabbix']['include_mysql'] and node['zabbix']['include_apache2'] are true.

setup_repository
Configures apt repository for the current version of zabbix.

server_mysql
Installs zabbix server package, mysql version.

php_frontend
Installs zabbix frontend package and configures it.

dependency_mysql
Installs and configures a local mysql server.

dependency_apache2
Installs and configure a local apache2 webserver with php support and specific zabbix tuning.

Need to configure in MariaDB RDS:
Set connection to RDS: 
 vi /etc/zabbix/zabbix_server.conf and /etc/zabbix/web/zabbix.conf.php
 DBHost=<name of endpoint in RDS>
 DBName=zabbix
 DBUser=<database user>
 DBPassword=<database password>

Create database in MariaDB RDS.
Character set utf8 and utf8_bin collation is required for Zabbix server to work properly with MariaDB database.
 shell> mysql -u <database user> -p -h <name of endpoint in RDS> 
 mysql> create database zabbix character set utf8 collate utf8_bin;
 mysql> grant all privileges on zabbix.* to zabbix@<name of endpoint in RDS> identified by '<password>';
 mysql> quit;

create zabbix schema from  the template:
 zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql zabbix -u <database user> -p <database password> -h <name of endpoint in RDS> 

Starting Zabbix server process
It's time to start Zabbix server process and make it start at system boot:
 # service zabbix-server start
 # update-rc.d zabbix-server enable

As frontend and SELinux configuration is done, you need to restart Apache web server:
 # service apache2 restart

Agent installation
To install the agent, run
 # apt install zabbix-agent
To start the agent, run:
 # service zabbix-agent start
