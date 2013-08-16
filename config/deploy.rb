require 'capistrano_colors'
require 'bundler/capistrano'
require 'database_yml/capistrano'

set :application, "chance"
set :repository,  "git@github.com:1ch/chance.git"
set :branch, "master"
set :deploy_to, "/var/www/chance"
set :rails_env, "production"

set :default_environment, {  
    'LANG' => 'en_US.UTF-8'  
       }

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "onechan"
set :use_sudo, false
ssh_options[:port] = "22"
ssh_options[:forward_agent] = true
set :default_run_options, :pty => true

role :web, "1-ch.info"                          # Your HTTP server, Apache/etc
role :app, "1-ch.info"                          # This may be the same as your `Web` server
role :db,  "1-ch.info", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

load 'deploy/assets'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
