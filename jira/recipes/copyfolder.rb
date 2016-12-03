#
# Cookbook Name:: jira
# Recipe:: copyfolder
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "backupInstall" do
    command "scp -r /opt/atlassian/jira /opt/atlassian/jira_backup"
    user "root"
    action :run
end
