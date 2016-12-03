#
# Cookbook Name:: jira
# Recipe:: installjira
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#This recipe for installation of JIRA latest version using bin file(not tar.gz)

#Download the file from Atlassian site from from stored location
#Execute it using command
#Provide input parameters

template "#{Chef::Config[:file_cache_path]}/response.varfile" do
    source 'response.varfile.erb'
    owner 'root'
    group 'root'
    mode '0644'
    # variables(
    #   'update' => ['jira']['version'])
    # )
end

remote_file "#{Chef::Config[:file_cache_path]}/atlassian-jira-software-7.2.0-x64.bin" do
    source 'https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.4-x64.bin'
    mode '0777'
    action :create
end

execute "Installing Latest" do
    cwd Chef::Config[:file_cache_path]
    command "./atlassian-jira-software-7.2.0-x64.bin -q -varfile response.varfile"
end

directory "node['jira']['install_path']" do
  owner node['jira']['user']
  group node['jira']['group']
  mode '777'
  recursive true
end
