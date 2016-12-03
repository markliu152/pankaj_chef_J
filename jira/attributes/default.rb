default['jira']['home_path']          = '/var/atlassian/application-data/jira'
default['jira']['install_path']       = '/opt/atlassian/jira'
default['jira']['backup_install_path']= '/opt/atlassian/jira_backup'
default['jira']['install_type']       = 'installer'
default['jira']['flavor']             = 'software'
default['jira']['user']               = 'jira'
default['jira']['group']              = 'jira'
default['jira']['backup_when_update'] = false
default['jira']['ssl']                = false

#Database details
default['jira']['dbhost']             = '192.168.63.130'
#default['jira']['dbhost']             = 'default-centos-72'
default['jira']['dbport']             = '5432'
default['jira']['dbname']             = 'jira_db'
default['jira']['dbuser']             = 'postgresjira'
default['jira']['dbpassword']         = 'postgresjira'
default['jira']['dbpool-min-size']    = '20'
default['jira']['dbpool-max-idle']    = '20'
default['jira']['dbpool-max-size']    = '20'
default['jira']['dbpool-max-wait']    = '30000'

#java details
default['jira']['jvm_minimum_memory']  = '256m'
default['jira']['jvm_maximum_memory']  = '768m'
default['jira']['jvm_maximum_permgen'] = '256m'
default['jira']['jvm_java_opts']       = ''
default['jira']['jvm_support_args']    = ''

default['jira']['tomcat_port'] = '8080'

default['java']['install_flavor'] = "oracle"
default['java']['oracle']['accept_oracle_download_terms'] = "true"
