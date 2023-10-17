require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/ssaunier"
user_serialized = URI.open(url).read
# p user_serialized
user = JSON.parse(user_serialized)
p user['name']

# puts "#{user["name"]} - #{user["bio"]}"
