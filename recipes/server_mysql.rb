package 'zabbix-server-mysql'

# install zabbix server conf
template "#{node['zabbix']['etc_dir']}/zabbix_server.conf" do
  source 'zabbix_server.conf.erb'
  owner 'root'
  group 'root'
  mode '644'
  variables(
    :dbhost             => node['zabbix']['database']['dbhost'],
    :dbname             => node['zabbix']['database']['dbname'],
    :dbuser             => node['zabbix']['database']['dbuser'],
    :dbpassword         => node['zabbix']['database']['dbpassword'],
    :dbport             => node['zabbix']['database']['dbport']
  )
 # notifies :start, 'service[zabbix-server]'
end

file '/etc/default/zabbix-server' do
  content 'START=yes
CONFIG_FILE="/etc/zabbix/zabbix_server.conf"
'
  owner 'root'
  mode '0640'
  #notifies :start, "service[zabbix-server]"
  action :create
end

service 'zabbix-server' do
  action :nothing
end

