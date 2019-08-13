remote_file '/tmp/zabbix-release_4.0-2+xenial_all.deb' do
  source 'http://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+xenial_all.deb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

dpkg_package 'zabbix-release_4.0-2+xenial_all.deb' do
  source "/tmp/zabbix-release_4.0-2+xenial_all.deb"
  action :install
end

execute "apt-get-update-periodic" do
command "apt-get update"
end

