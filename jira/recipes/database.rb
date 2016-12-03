#
# Cookbook Name:: jira
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'database::postgresql'
include_recipe 'postgresql::config_pgtune'
include_recipe 'postgresql::server'
#include_recipe 'database::postgresql'


#creating postgres connection details
postgresql_connection_info = {
  :host     => node['jira']['dbhost'],
  :port     => 5432,
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

#creating DB user postgresjira and set password
postgresql_database_user node['jira']['dbuser'] do
  connection postgresql_connection_info
  password node['jira']['dbpassword']
  action :create
end

#Creating postgres SQL database
postgresql_database 'jira_db' do
    connection postgresql_connection_info
    connection_limit '-1'
    # See: https://confluence.atlassian.com/display/JIRAKB/Health+Check%3A+Database+Collation
    encoding 'utf8'
    collation 'C'
    template 'template0'
    owner node['jira']['dbuser']
    action :create
end

#Grant all privileges to above use on the jira_db
postgresql_database_user node['jira']['dbuser'] do
  connection postgresql_connection_info
  database_name node['jira']['dbname']
  privileges    [:all]
  action :grant
end
