#
# Cookbook Name:: documentr
# Recipe:: undeploy
#
# Copyright 2013
#

# Delete Data directory
directory node["documentr"]["config_dir"] do
  recursive true
  action :delete
end

