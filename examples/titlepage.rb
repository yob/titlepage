# assuming you have titlepage installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'titlepage'
require File.dirname(__FILE__) + '/../lib/titlepage'

TitlePage::Client.open("username", "password") do |tp|

  puts tp.first("0091835135").inspect
  sleep 3
  puts tp.all("1741146712").inspect

end
