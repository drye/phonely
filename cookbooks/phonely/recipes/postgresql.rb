#
# Recipe:: postgresql
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postgresql::client"
include_recipe "postgresql::server"
include_recipe "postgresql::contrib"

# Creates the phonely postgres user
pg_user node['phonely'][:dbuser] do
    privileges :superuser => true, :createdb => true, :login => true
    password node['phonely'][:dbpassword]
end

#Creates the phonely postgres database 
execute "create-db" do
    db_exists = <<-EOH
    psql -U postgres -c "select * from pg_database where datname='#{node['phonely'][:dbname]}'" | grep -c #{node['phonely'][:dbname]}
    EOH
    user "postgres"
    command "createdb -U postgres -O #{node['phonely'][:dbuser]} -E utf8 -T template0 #{node['phonely'][:dbname]}"
    not_if db_exists, :user => 'postgres'
end

# Creates the UUID-OSSP extension
execute "create-uuid-ossp-extension" do
    user "postgres"
    command 'psql -U postgres -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\""'
end
