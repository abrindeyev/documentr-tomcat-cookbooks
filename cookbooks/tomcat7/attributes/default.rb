tc7target = "/opt"
##
default[:tomcat7][:version] = "7.0.34"
default[:tomcat7][:user] = "tomcat"
default[:tomcat7][:group] = "tomcat"
default[:tomcat7][:target] = "#{tc7target}"
##
default[:tomcat7][:port] = 8080
default[:tomcat7][:ssl_port] = 8443
default[:tomcat7][:ajp_port] = 8009
default[:tomcat7][:java_options] = " -Xmx128M -Djava.awt.headless=true"
default[:tomcat7][:use_security_manager] = "no"
##
default[:tomcat7][:home] = "#{tc7target}/tomcat"
default[:tomcat7][:base] = "#{tc7target}/tomcat"
default[:tomcat7][:config_dir] = "#{tc7target}/tomcat/conf"
default[:tomcat7][:log_dir] = "#{tc7target}/tomcat/logs"
