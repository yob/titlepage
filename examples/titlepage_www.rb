# assuming you have rbook installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'rbook/titlepage'
require File.dirname(__FILE__) + '/../lib/rbook/titlepage'
require File.dirname(__FILE__) + '/../lib/rbook/onix'

client = RBook::TitlePage::WWWClient.new

client.login("username", "password")

  text = client.get_onix_file("9780060000707")
  #msg = RBook::Onix::Message.load_from_string(text)
  #puts msg.to_s
  puts text

client.logout
