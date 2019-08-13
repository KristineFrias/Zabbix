include_recipe "zabbixtest::apt"
include_recipe "zabbixtest::setup_repository"
include_recipe "zabbixtest::dependency_mysql" if node['zabbix']['include_mysql']
include_recipe "zabbixtest::server_mysql"
include_recipe "zabbixtest::dependency_apache2" if node['zabbix']['include_apache2']
include_recipe "zabbixtest::php_frontend"
