# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'buyonline'
set :repo_url, 'git@github.com:Arohak/AHOnline_Backend.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/buyonline'
set :deploy_user, 'deployer'

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/private_pub.yml', '.env'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :rails_env, :production

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end

