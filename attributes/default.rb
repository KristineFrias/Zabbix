default['zabbix']['include_apache2'] = false
default['zabbix']['include_mysql'] = false

default['zabbix']['etc_dir'] = '/etc/zabbix'
default['zabbix']['log_dir'] = '/var/log/zabbix'
default['zabbix']['run_dir'] = '/var/run/zabbix'
default['zabbix']['alert_dir'] = '/etc/zabbix/alert.d/'

default['zabbix']['database']['install_method']     = 'mysql'
default['zabbix']['database']['dbname']             = 'zabbix'
default['zabbix']['database']['dbuser']             = 'zabbixuser'
default['zabbix']['database']['dbhost']             = 'localhost'
default['zabbix']['database']['dbpassword']         = 'zabbix'
default['zabbix']['database']['dbport']             = 3306

default['zabbix']['server']['host'] = 'localhost'
default['zabbix']['server']['port'] = 10051
default['zabbix']['server']['name'] = 'Zabbix'
default['zabbix']['server']['log_file'] = ::File.join(node['zabbix']['log_dir'], 'zabbix_server.log')
default['zabbix']['server']['log_level'] = 3

default['zabbix']['web']['fqdn'] = node['fqdn']
