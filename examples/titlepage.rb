# assuming you have rbook installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'rbook/titlepage'
require "rubygems"
require File.dirname(__FILE__) + '/../lib/titlepage'

TitlePage::Client.open("username", "password") do |tp|

  puts tp.find("0091835135").inspect
  sleep 3
  puts tp.find("1741146712").inspect

end
