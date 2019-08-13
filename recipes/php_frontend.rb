
package 'zabbix-frontend-php'

template "#{node['zabbix']['etc_dir']}/web/zabbix.conf.php" do
  source 'zabbix.conf.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '0640'
  variables(
    :database => node['zabbix']['database'],
    :server => node['zabbix']['server']
  )
end

