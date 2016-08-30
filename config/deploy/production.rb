set :stage, :production

server '37.139.31.137', user: 'deploy', roles: %w{web app db}
