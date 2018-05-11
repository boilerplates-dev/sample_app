set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').chomp.to_s
set :rbenv_custom_path, '$HOME/.rbenv' # will be fixed by https://github.com/capistrano/rbenv/pull/59

set :application, 'sample_app'
set :repo_url, 'https://github.com/boilerplates-dev/sample_app.git'

set :deploy_to, -> { "/var/www/#{fetch(:application)}_#{fetch(:stage)}" }

set :puma_bind, %w[tcp://172.20.30.20:3000 tcp://172.20.30.21:3000]
set :puma_nginx, :load_balancer
set :puma_init_active_record, true

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w[.env]

# Default value for linked_dirs is []
set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets]

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :bundler do
  task :map_bins do
    fetch(:bundle_bins).each do |command|
      SSHKit.config.command_map.prefix[command.to_sym].push('dotenv')
    end
  end
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end
end
