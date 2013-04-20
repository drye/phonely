#
# Recipe:: User
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

# Required by chef in order to create hashed passwords
chef_gem "ruby-shadow" do
    action :install
end

# Create user
user node["phonely"][:user] do
    supports :manage_home => true
    home "/home/%s" % node["phonely"][:user]
    shell "/bin/bash"
    password "$1$kxyXXQx4$6e83vZwbMNc4lJe8eiQPF."
end
