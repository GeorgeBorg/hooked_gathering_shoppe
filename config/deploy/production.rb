set :stage, :production

server '82.196.13.14', user: 'deploy', roles: %w{web app db}
