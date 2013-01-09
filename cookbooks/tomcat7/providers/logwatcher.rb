#
# Cookbook Name:: tomcat7
# Provider:: logwatcher
#
# Copyright:: 2013, Andrey Brindeyev
#

action :watch_for_line do
  Chef::Log.debug("Watching for pattern [#{new_resource.pattern}] in #{new_resource.name} within #{new_resource.timeout} seconds")
  started_at = ::Time.now

  while not ::File.exists?(new_resource.name)
    sleep 0.5
  end

  f = ::File.open(new_resource.name,"r")
  f.seek(0, IO::SEEK_END)

  found = false
  while ::Time.now - started_at < new_resource.timeout
    io =  f.gets
    if io and io.match(new_resource.pattern)
      Chef::Log.debug("Watch matched after #{(Time.now.to_f - started_at.to_f)} seconds")
      found = true
      break
    end
    sleep 0.1
  end
  if not found
      Chef::Log.debug("Watch failed within given timeout")
      exit 1
  end
end

