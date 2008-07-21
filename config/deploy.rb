default_run_options[:pty] = true
set :scm, :git
set :scm_username,  'bryansray'
set :application, "smerb"
set :repository,  "git@github.com:bryansray/smerb.git"

set :keep_releases, 5
set :application,   'smerb'
set :user,          'bryan'
set :deploy_to,     "/var/www/#{application}"

set :production_database,'smerb_production'

set :runner, user

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false

role :app, "209.20.80.236"
role :web, "209.20.80.236"
role :db,  "209.20.80.236", :primary => true

desc "Link in the production extras and migrate the database"
  task :after_update_code do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

desc "Merb it up with"
  deploy.task :restart do
    sudo "/etc/init.d/thin restart"
  end