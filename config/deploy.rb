
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "phrasr"

set :use_sudo, false
set :user, 'ssh-21560'

set :rvm_type, :user
set :rvm_ruby_string, "ruby-1.9.2-p136@#{application}"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/kunden/warteschlange.de/produktiv/rails/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :repository, "git://github.com/rngtng/#{application}.git"
set :branch, "master"

set :deploy_via, :remote_cache

set :ssh_options, :forward_agent => true

role :app, "#{application}.warteschlange.de"
role :web, "#{application}.warteschlange.de"
role :db,  "#{application}.warteschlange.de", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Link in the production database.yml"
  task :link_configs do
    run "ln -nfs #{deploy_to}/#{shared_dir}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/#{shared_dir}/uploads #{release_path}/public/system"    
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# HOOKS
after "deploy:update_code" do
  deploy.link_configs
end
