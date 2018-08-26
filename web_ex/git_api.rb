require 'octokit'

# client = Octokit::Client.new(login: 'Shelkopryad', password: 'Xo4y_CeKca!')
# user = client.user
# user.login

# Set access_token instead of login and password if you use personal access token
client = Octokit::Client.new(:access_token => 'TOKEN')

# Fetch the current user
# p client.user
p client.repos({}, query: {name: 'owner', sort: 'asc'})