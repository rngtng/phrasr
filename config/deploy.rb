set :application, "phrasr"
set :local_repository,  "svn+ssh://ssh-21560@www.warteschlange.de/kunden/warteschlange.de/.repos/phrasr/trunk"
set :repository,  "file:///kunden/warteschlange.de/.repos/phrasr/trunk"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:

set :deploy_to,    "/kunden/warteschlange.de/produktiv/rails/phrasr/" 

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :user, "ssh-21560-rails"     # defaults to the currently logged in user

set :use_sudo, false

role :web, "whoami.warteschlange.de"
role :app, "whoami.warteschlange.de"
role :db,  "whoami.warteschlange.de", :primary => true

set :keep_releases, 3

namespace :deploy do
#   task :set_config, :roles => :app do
 #     run "cp /home/htdocs/kappaextern/configs/database.yml #{release_path}/config/database.yml"
  # end
   
  task :start, :roles => :web do
    run "mongrel_rails start -e production -d -n 3 -c #{deploy_to}current"
  end
  
  task :stop, :roles => :web do
    run "mongrel_rails stop -c #{deploy_to}current"
  end

 
end

before  'deploy:restart', 'deploy:stop'
after   'deploy:restart', 'deploy:start'

