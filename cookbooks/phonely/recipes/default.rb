#
# Recipe:: Phonely
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "phonely::user"
include_recipe "phonely::postgresql"
include_recipe "phonely::python"
include_recipe "phonely::phppgadmin"
include_recipe "phonely::thrift"

# Additional packages...
%w{ git nodejs }.each do |system_package|
    package system_package do
        action  :install
    end
end
