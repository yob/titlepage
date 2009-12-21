$:.unshift File.dirname(__FILE__) + "/lib"

require 'titlepage'
run TitlePage::Rest
