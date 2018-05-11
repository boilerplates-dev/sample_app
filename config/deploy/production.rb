role :app, %w[deploy@172.20.30.20 deploy@172.20.30.21]

set :stage, :production
set :branch, 'master'

set :nginx_server_name, 'sample.com assets.sample-cdn.com'
