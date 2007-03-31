# assuming you have rbook installed via rubygems,
# in a regular script, replace the following require
# line with these 2 lines:
#   require 'rubygems'
#   require 'rbook/titlepage'
require File.dirname(__FILE__) + '/../lib/rbook/titlepage'

RBook::TitlePage::Client.use_proxy("druby://127.0.0.1:61676")

RBook::TitlePage::Client.open("username", "password") do |tp|

  puts tp.find("0091835135").product.title.titleText

end
