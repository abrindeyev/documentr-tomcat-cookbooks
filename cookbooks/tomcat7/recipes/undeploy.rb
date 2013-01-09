#
# Cookbook Name:: tomcat7
# Recipe:: undeploy
#
# Copyright 2013
#
tc7ver = node["tomcat7"]["version"]
tc7tarball = "apache-tomcat-#{tc7ver}.tar.gz"
tc7url = "#{node['repository']}/#{tc7tarball}"
tc7target = node["tomcat7"]["target"]
tc7user = node["tomcat7"]["user"]
tc7group = node["tomcat7"]["group"]

# Stop Tomcat service
service "tomcat7" do
    service_name "tomcat7"
    action :stop
end

# Delete binary distro
file "/tmp/#{tc7tarball}" do
  action :delete
end

# Delete user
user "#{tc7user}" do
    action :remove
end

# Delete group
#group "#{tc7group}" do
#    action :remove
#end

# Delete the symlink
link "#{tc7target}/tomcat" do
  action :delete
end

# Delete base folder
directory "#{tc7target}/apache-tomcat-#{tc7ver}" do
  recursive true
  action :delete
end

# Delete initscript
file "/etc/init.d/tomcat7" do
  action :delete
end

