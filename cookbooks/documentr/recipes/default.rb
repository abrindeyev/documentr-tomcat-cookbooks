#
# Cookbook Name:: documentr
# Recipe:: default
#
# Copyright 2013, Andrey Brindeyev
#

include_recipe "tomcat7::default"

tc7ver = node["tomcat7"]["version"]
tc7tarball = "apache-tomcat-#{tc7ver}.tar.gz"
tc7url = "#{node['repository']}/#{tc7tarball}"
tc7target = node["tomcat7"]["target"]
tc7user = node["tomcat7"]["user"]
tc7group = node["tomcat7"]["group"]

# Get binary distro
remote_file "#{tc7target}/apache-tomcat-#{tc7ver}/webapps/documentr.war" do
    source node["documentr"]["war_url"]
    owner "#{tc7user}"
    group "#{tc7group}"
    mode "0644"
end

# Documentr data directory
directory node["documentr"]["config_dir"] do
    owner "#{tc7user}"
    group "#{tc7group}"
    mode "0755"
    action :create
end

# Add the Documentr settings to Apache Tomcat
template "#{tc7target}/apache-tomcat-#{tc7ver}/conf.d/documentr.sh" do
    source "documentr.sh.erb"
    owner "#{tc7user}"
    group "#{tc7group}"
    mode "0644"
    notifies :restart, "service[tomcat7]", :immediately
end

tomcat7_logwatcher "#{tc7target}/apache-tomcat-#{tc7ver}/logs/catalina.out" do
  pattern "Server startup in"
  timeout 60
  action :watch_for_line
end
