server '13.208.130.205', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/jima/.ssh/id_rsa'
