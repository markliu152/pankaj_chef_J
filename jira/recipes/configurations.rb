#settings = Jira.settings(node)

#
# Cookbook Name:: jira
# Recipe:: configurations
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#This file will consists of details about all JIRA configurations done to JIRA setup

template "#{node['jira']['home_path']}/dbconfig.xml" do
    source 'dbconfig.xml.erb'
    owner 'jira'
    mode '0777'
    #variables :database => settings['database']
    #notifies :restart, 'service[jira]', :delayed
    notifies :run, 'execute[stopjira]', :delayed
end

# template '/etc/init.d/jira' do
#     source 'jira.init.erb'
#     mode '0755'
#     #notifies :restart, 'service[jira]', :delayed
#     notifies :run, 'execute[stopjira]', :delayed
# end

execute 'stopjira' do
    command '/opt/atlassian/jira/bin/stop-jira.sh'
    notifies :run, 'execute[startjira]', :delayed
    #command '/opt/atlassian/jira/bin/start-jira.sh'
    action :nothing
end

execute 'startjira' do
    command '/opt/atlassian/jira/bin/start-jira.sh'
    action :nothing
end

# service 'jira' do
#   supports :status => :true, :restart => :true
#   action :enable
#   subscribes :restart, 'java_ark[jdk]'
# end

template "#{node['jira']['install_path']}/atlassian-jira/WEB-INF/classes/jira-application.properties" do
  source 'jira-application.properties.erb'
  owner node['jira']['user']
  mode '0644'
  notifies :run, 'execute[stopjira]', :delayed
  #notifies :restart, 'service[jira]', :delayed
end
