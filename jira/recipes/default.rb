#
# Cookbook Name:: jira
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Inclucding cookbooks from supetmarket

#include_recipe 'java::oracle'
#include_recipe 'jira::database'
#include_recipe 'database::postgresql'
include_recipe 'jira::copyfolder'
include_recipe 'jira::installjira'
include_recipe 'jira::configurations'
include_recipe 'jira::container_server_configuration'
include_recipe 'jira::misc'


#Installaton of JDK on the server
#java_ark "jdk" do
#    url 'http://javadl.oracle.com/webapps/download/AutoDL?BundleId=211989'
#    app_home '/usr/java/default'
#     bin_cmds["java"]
#    action [:remove]
#end
