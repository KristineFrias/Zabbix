provider = Chef::Provider::ZabbixDatabaseMySql
include_recipe "mysql::server"
include_recipe "database::mysql"


mysql_database 'zabbix' do
  connection(
    :host     => '127.0.0.1',
    :username => 'zabbixuser',
    :password => node['mysql']['zabbix']
  )
  action :create
end

mysql_database "zabbix" do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'zabbixuser' do
  connection mysql_connection_info
  password   'zabbix'
  privileges [ :all ]
  action [:create, :grant]
end

