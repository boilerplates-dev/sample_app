role :app, %w{deploy@sample.com}
role :web, %w{deploy@sample.com}
role :db,  %w{deploy@sample.com}

set :deploy_user, 'deploy'
server 'sample.com', user: 'deploy', roles: %w{web app}

set :stage, :production
set :branch, 'master'

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
