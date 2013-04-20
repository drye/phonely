#
# Recipe:: phppgadmin
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

# Install the phppgadmin package
package "phppgadmin" do
    action :install
end

# Override the default config with our configuration
template "/etc/phppgadmin/config.inc.php" do
    source "config.inc.php.erb"
    mode 00644
    action :create
end

# Override the apache config file with our configuration
template "/etc/apache2/conf.d/phppgadmin" do
    source "phppgadmin.erb"
    mode 00644
    action :create
    notifies :restart, "service[apache2]", :immediately
end
