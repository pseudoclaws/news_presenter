require 'mina/rails'
require 'mina/git'
require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'news_presenter'
set :domain, 'news.ingrotto.com'
set :user, 'deploy'
set :deploy_to, "/home/#{user}/#{application_name}"
set :repository, 'git@github.com:pseudoclaws/news_presenter.git'
set :branch, 'master'

# Optional settings:
#   set :port, '30000'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
set :shared_paths, %w(log tmp config/database.yml)
# set :shared_dirs, %w(log tmp)
# set :shared_files, %w(config/database.yml)

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.4.0]'
  # queue! 'rvm use 2.4.0'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
  command %{mkdir -p  #{deploy_to}/shared/log}
  command %{chmod g+r,u+rw  #{deploy_to}/shared/log}

  command %{mkdir -p  #{deploy_to}/shared/tmp}
  command %{chmod g+r,u+rw  #{deploy_to}/shared/tmp}

  command %{mkdir -p  #{deploy_to}/shared/tmp/pids}
  command %{chmod g+r,u+rw  #{deploy_to}/shared/tmp/pids}

  command %{mkdir -p  #{deploy_to}/shared/config}
  command %{chmod g+r,u+rw  #{deploy_to}/shared/config}

  command %{mkdir -p  #{deploy_to}/shared/db/redis}
  command %{chmod g+r,u+rw  #{deploy_to}/shared/db/redis}

  command %{touch  #{deploy_to}/shared/config/database.yml}
  comment "-----> Be sure to edit 'shared/config/database.yml'."
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'rvm:use[ruby-2.4.0]'
    queue! 'rvm use 2.4.0'
    invoke :'bundle:install'
    invoke :'rails:db_create'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'
    # invoke :'deploy:cleanup'
    # to :launch do
    #   queue "if [ -f #{rails_root}/tmp/pids/unicorn.pid ] && [ -e /proc/$(cat #{rails_root}/tmp/pids/unicorn.pid) ]; then kill -USR2 `cat #{rails_root}/tmp/pids/unicorn.pid`; else cd #{rails_root} && bundle exec unicorn -c config/unicorn.rb -E #{rails_env} -D; fi"
    # end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
