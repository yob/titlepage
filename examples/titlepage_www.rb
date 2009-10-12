# assuming you have titlepage installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'titlepage'
require File.dirname(__FILE__) + '/../lib/titlepage'

TitlePage::WWWClient.open("username","password") do |client|
  puts client.get_onix_file("9780060000707")
end
