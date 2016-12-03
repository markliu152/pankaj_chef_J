#settings = Jira.settings(node)
#
# Cookbook Name:: jira
# Recipe:: container_server_configuration
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#This file contains the main JIRA server configuration related server.xml setenv.sh for tomcat

# template "#{node['jira']['install_path']}/bin/permgen.sh" do
#   source 'permgen.sh.erb'
#   owner node['jira']['user']
#   mode '0755'
#   notifies :run, 'execute[stopjira]', :delayed
#   #notifies :restart, 'service[jira]', :delayed
# end

template "#{node['jira']['install_path']}/bin/setenv.sh" do
  source 'setenv.sh.erb'
  owner node['jira']['user']
  mode '0755'
  notifies :run, 'execute[stopjira]', :delayed
  #notifies :restart, 'service[jira]', :delayed
end

template "#{node['jira']['install_path']}/conf/server.xml" do
  source 'server.xml.erb'
  owner node['jira']['user']
  mode '0640'
  variables(
    #tomcat: settings['tomcat'],
    template_partial_version: Gem::Version.new(node['jira']['version']).segments.first
  )
  notifies :run, 'execute[stopjira]', :delayed
  #notifies :restart, 'service[jira]', :delayed
end
