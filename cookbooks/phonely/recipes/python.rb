#
# Recipe:: default
#
# Copyright 2013, Phonely
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"

# Install virtualenvwrapper globally
python_pip "virtualenvwrapper" do
    action :install
end

# Create a virtual environment in vagrant's home folder
python_virtualenv node["phonely"][:virtualenv] do
    owner node["phonely"][:user]
    group node["phonely"][:user]
    action :create
end

# Install a few pip packages in the virtual environment
['sqlalchemy', 'fixtures', 'nose', 'psycopg2'].each do |pip_package|
    python_pip pip_package do
        virtualenv node["phonely"][:virtualenv]
        action :install
    end
end

# Modify .profile to include virtualenvwrapper stuff
execute "install virtualenvwrapper stuff" do
    code = <<-EOH
export WORKON_HOME=\\$HOME/.virtualenvs
export PROJECT_HOME=\\$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh    
EOH
    command "echo \"#{code}\" >> /home/#{node['phonely'][:user]}/.bashrc"
    not_if "grep -c virtualenv /home/#{node['phonely'][:user]}/.bashrc"
end
