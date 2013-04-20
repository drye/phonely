#
# Recipe:: Thrift
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

# Let's be sure we can build stuff
include_recipe "build-essential"

version = node['phonely']['thrift_version']

# Some prerequisites for building stuff
%w{ default-jre libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev flex bison libtool autoconf pkg-config python-dev python-twisted }.each do |pkg|
  package pkg
end

# Fetch the thrift sources
remote_file "#{Chef::Config[:file_cache_path]}/thrift-#{version}.tar.gz" do
  source "#{node['phonely']['thrift_mirror']}/thrift/#{version}/thrift-#{version}.tar.gz"
end

# Configure and compile thrift, and install the python libraries in the virtualenv folder
bash "install_thrift" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    (tar -zxvf thrift-#{version}.tar.gz)
    (cd thrift-#{version} && ./configure #{node['thrift']['configure_options'].join(' ')})
    (cd thrift-#{version} && make install)
    (cd thrift-#{version}/lib/py && #{node['phonely']['virtualenv']}/bin/python setup.py install)
  EOH
  not_if { FileTest.exists?("/usr/local/bin/thrift") }
end
