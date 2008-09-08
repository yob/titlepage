require 'rubygems'
require File.dirname(__FILE__) + '/../lib/titlepage'

client = TitlePage::WWWClient.new

client.login("username", "password")

text = client.get_onix_file("9780060000707")
puts text

client.logout
