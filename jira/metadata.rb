name 'jira'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Upgrade jira'
long_description 'Installs/Configures jira'
version '0.2.0'

recipe 'jira', 'Installs JIRA on the Linux machine'
recipe 'jira::installjira','Actual installation of JIRA via installer'
recipe 'jira::database','Configures database using mysql/postgres, creats connjecting user and connecting to the database'
recipe 'jira::configurations','Confiures JIRA configuration related to DB details, jira service'
recipe 'jira::container_server_configuration','Configures details related to tomcat like server.xml and setenv.sh'


depends 'ark', '~> 1.2.0'
depends 'database', '~> 5.1.2'
depends 'java', '~> 1.42.0'
depends 'postgresql', '~> 4.0.6'
