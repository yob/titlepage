# encoding: utf-8

require "bigdecimal"
require "handsoap"
require "andand"
require "isbn10"
require "ean13"

# a convenience module for accessing the SOAP API for http://www.titlepage.com.
# Uses boilerplate code generated by soap4r.
#
# You should be aware of any limits of query volume imposed by the provider - currently a
# maximum of 30 queries per minute is permitted.
#
# All examples require the following two lines at the top of your file:
#   require 'rubygems'
#   require 'titlepage'
#
# Basic usage:
#  tp = TitlePage::Client.new
#  tp.login('someuser','topsecret')
#  puts tp.find("0091835135").inspect
#  sleep 3
#  puts tp.find("9780672327568").inspect
#  tp.logout
#
# Alternative Usage:
#  TitlePage::Client.open("username","password") do |tp|
#    puts tp.find("0091835135").inspect
#    sleep 3
#    puts tp.find("9780672327568").inspect
#  end
module TitlePage
  SERVICE_ENDPOINT = {
    :uri => "http://www.titlepage.com.au/ws/TitleQuery.php",
    :version => 1
  }
  class NotLoggedInError < RuntimeError;end;
end

require File.dirname(__FILE__) + '/titlepage/driver'
require File.dirname(__FILE__) + '/titlepage/utils'
require File.dirname(__FILE__) + '/titlepage/client'
require File.dirname(__FILE__) + '/titlepage/rest'
