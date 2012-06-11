# $:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require "bundler/capistrano"

set :application, 'magazyn'
set :user, 'sebek'
set :domain, 'wojtczaks.pl'
set :server_hostname, 'wojtczaks.pl'
set :deploy_to, lambda { "/home/#{user}/website" }
set :rvm_ruby_string, '1.9.3@magazyn'
set :bundle_flags, "--deployment --binstubs --shebang ruby-local-exec"

set :keep_releases, 5

set :rvm_type, :user  # Copy the exact line. I really mean :user here

set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }

role :web, domain
role :app, domain
role :db, domain, :primary => true

default_run_options[:pty] = true
set :repository,  "git@github.com:sabcio/pai-magazyn.git"
set :scm, "git"
set :user, user

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false

namespace :deploy do
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/thin.yml #{current_path}/thin.yml"
    run "ln -nfs #{shared_path}/config/production.sqlite3 #{current_path}/db/production.sqlite3"
    run "ln -nfs #{shared_path}/config/production.yml #{current_path}/config/settings/production.yml"
  end
end

after 'deploy:create_symlink', 'deploy:symlink_shared'

# Override the restart task to do something better
deploy.task :restart, :roles => :app do
  # deploy.web.disable

  migrate
  assets.precompile

  thin.restart

  sleep 5
  # deploy.web.enable
  deploy.cleanup
end

deploy.web.task :disable, :roles => :web do
  run "if [ ! -f #{current_path}/public/maintenance.html ]; then cp #{current_path}/public/maintenance.html #{current_path}/public/index.html; fi"
end

deploy.web.task :enable, :roles => :web do
  run "if [ -f #{current_path}/public/index.html ]; then rm #{current_path}/public/index.html; fi"
end

namespace :assets do
  desc "Precompile assets"
  task :precompile, :roles => :app do
    run "cd #{current_path}; bundle exec rake assets:precompile RAILS_ENV=production"
  end
end

# Thin tasks
namespace :thin do
  desc "Restart thin"
  task :restart, :roles => :app do
    stop
    start
  end

  desc "Stop thin"
  task :stop, :roles => :app do
    run "cd #{current_path}; bundle exec thin stop -C thin.yml;"
  end

  desc "Start thin"
  task :start, :roles => :app do
    run "cd #{current_path};  bundle exec thin start -C thin.yml;"
  end
end
