
default_run_options[:pty] = true
set :scm, :git
set :scm_username,  'bryansray'
set :application, "smerb"
set :repository,  "git@github.com:bryansray/smerb.git"
#set :branch, "stable"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :keep_releases, 5
set :application,   'smerb'
set :user,          'bryan'
# set :password,      ''
set :deploy_to,     "/var/www/#{application}"
#set :deploy_via,    :filtered_remote_cache
#set :repository_cache,    "/var/cache/#{application}"
# set :monit_group,   'merb_smerb'

set :production_database,'smerb_production'

set :runner, user

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false

role :app, "209.20.80.236"
role :web, "209.20.80.236"
role :db,  "209.20.80.236", :primary => true