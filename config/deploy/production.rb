# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '146.148.118.80', user: 'araha', roles: %w{app db web}, primary: true

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w{araha@146.148.118.80}
role :web, %w{araha@146.148.118.80}
role :db,  %w{araha@146.148.118.80}

set :rails_env, :production

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
 set :ssh_options, {
   keys: %w(/Users/araha/.ssh/id_rsa),
   forward_agent: true,
   auth_methods: %w(publickey password),
   port: 22
 }
