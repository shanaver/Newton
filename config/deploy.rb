#set :deploy_location, Proc.new { deploy_location = Capistrano::CLI.ui.ask "Enter deploy location (staging/production)" }

set :deploy_location, "production"
 
if "#{deploy_location}" == "production"
 set :application, "newtonapp.com"
 set :ipaddress, "174.143.243.138"
 set :branch, "master"
else
 set :deploy_location, "staging" 
 set :application, "dev.newtonapp.com"
 set :ipaddress, "174.143.243.138"
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
set :keep_releases, 3

default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true, :port => "20022"}
set :user, "root"
set :use_sudo, "false"

namespace :deploy do
    
  desc "Link to the uploads dir"
  task :after_symlink, :roles => :app do
    cleanup
  end

  # desc "Creates and links the shared directories"   
  # task :create_symlinks, :roles => :app do
  #   run "rm -rf #{release_path}/media"
  #   run "ln -nfs #{shared_path}/media #{release_path}/media"
  #   run "rm -rf #{release_path}/var"
  #   run "ln -nfs #{shared_path}/var #{release_path}/var"
  #   run "rm -rf #{release_path}/export"
  #   run "ln -nfs #{shared_path}/export #{release_path}/export"
  # end
  
  # desc "redirect all traffic to maintenance.html"
  # task :maintenance_redirect_on, :roles => :app do  
  #    run "rm /var/www/#{application}/current/.htaccess"
  #    run "cp /var/www/#{application}/current/.htaccess.maintenance /var/www/#{application}/current/.htaccess"
  # end
  # 
  # desc "remove maintenance redirect"
  # task :maintenance_redirect_off, :roles => :app do  
  #    set_htaccess
  # end
  
   task :restart do
    #do nothing
   end

end
