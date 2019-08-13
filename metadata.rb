name 'zabbixtest'
maintainer 'Kristine'
maintainer_email 'kristine.frias@chromedia.com'
license 'Apache2'
description 'Installs/Configures Zabbix 4.0-2'
long_description 'Installs/Configures Zabbix 4.0-2'
version '0.1.0'
chef_version '>= 13.0'

depends          'apache2'
depends          'database'
depends          'openssl'
depends          'php'
depends          'apt'
depends          'mysql'
depends          'mysql-chef_gem'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/zabbixtest/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/zabbixtest'
