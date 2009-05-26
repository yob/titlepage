# assuming you have titlepage installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'titlepage'
require File.dirname(__FILE__) + '/../lib/titlepage'

client = TitlePage::WWWClient.new

client.login("username", "password")

text = client.get_onix_file("9780060000707")
puts text

client.logout
