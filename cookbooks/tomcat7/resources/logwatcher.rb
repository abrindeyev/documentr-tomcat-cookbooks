#
# Cookbook Name:: tomcat7
# Resource:: logwatcher
#
# Copyright:: 2013, Andrey Brindeyev
#

actions :watch_for_line

attribute :logfile, :name_attribute => true
attribute :pattern, :kind_of => String
attribute :timeout, :default => 60
