#
# Cookbook Name:: jira
# Recipe:: misc
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#This recipe is created for setting misc setting after setup of all configurations

#changing the owner,group and chmod of all files/folders

execute 'change file perms' do
    command "chown -R jira:jira #{node['jira']['home_path']}"
    command "chmod -R 0755 #{node['jira']['home_path']}"
    command "chown -R jira:jira #{node['jira']['install_path']}"
    command "chown -R jira:jira #{node['jira']['install_path']}"
    user 'root'
    action :run
end
