#set :deploy_location, Proc.new { deploy_location = Capistrano::CLI.ui.ask "Enter deploy location (staging/production)" }
set :deploy_location, "production"

require 'bundler/capistrano'
 
if "#{deploy_location}" == "production"
 set :application, "newtonapp.com"
 set :ipaddress, "174.143.150.156"
 set :branch, "master"
else
 set :deploy_location, "staging" 
 set :application, "dev.newtonapp.com"
 set :ipaddress, "174.143.150.156"
 set :branch, "master"
end

set :deploy_to, "/var/www/#{application}"

role :app, "#{ipaddress}"
role :web, "#{ipaddress}"
role :db,  "#{ipaddress}", :primary => true

set :scm, "git"
set :repository,  "git@github.com:shanaver/Newton.git"
set :deploy_via, :remote_cache
set :checkout, "export"

# not needed for git - uses key instead
#set :scm_username, Proc.new { CLI.ui.ask "SVN Username: "}
#set :scm_password, Proc.new { Capistrano::CLI.password_prompt("SVN Password for #{scm_username}: ")}

# saves space by only keeping last 3 when running cleanup
set :keep_releases, 6

default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true, :port => "20022"}
set :user, "root"
set :use_sudo, "false"


desc "after_symlink cleanup"
after 'deploy:symlink', :roles => :app do
  deploy.cleanup
end


#############################################################
#	Custom Server Tasks
#############################################################

# overwrite the old capistrano restart procedure
desc "Restart Application"
deploy.task :restart, :roles => :web do
  if rails_env == 'production'
    invoke_command "apache2ctl graceful", :via => run_method
  end
end

# add apache tasks to cap commands
namespace :apache do
  [:stop, :start, :restart, :reload, :graceful, :configtest].each do |action|
    desc "#{action.to_s.capitalize} Apache"
    task action, :roles => :web do
      invoke_command "apache2ctl #{action.to_s}", :via => run_method
    end
  end
end
