# coding: utf-8

###################################################################
# A proxy REST web service for the titlepage SOAP API.
#
# Requires no state and exists to serialise requests to the authoritive
# API so that an organisation can avoid exceeding the API usage limits.
#
# To use this REST wrapper, run the following:
#
#     thin -R config.ru -p 4567 start
#
# This make the following request:
#
#     curl http://127.0.0.1:4567/username/password/ean
#
# Returns 400 if the requested EAN is invalid
# Returns 401 if the titlepage API returned an error, often an authentication issue
# Returns 404 if the requested EAN wasn't found on titlepage
# Returns 408 if the titlepage API didn't respond in time
# Returns 200 and a YAML serialised hash of results if the query was successful
#
###################################################################

require 'rubygems'
require 'sinatra/base'
require 'ean13'
require 'yaml'
require 'timeout'

module TitlePage
  class Rest < Sinatra::Base

    TIMESTAMP_FILE = "/tmp/titlepage.dat"

    # We only respond to 1 URI
    get '/:username/:password/:ean' do |username, password, ean|
      status(400) and return unless EAN13.valid?(ean)

      while (!update_file)
        sleep 0.5
      end

      result = nil

      begin
        TitlePage::Client.open(username, password) do |tp|
          Timeout::timeout(6) do
            result = tp.first(ean)
          end
        end
      rescue Timeout::Error
        status(408) and return
      rescue Handsoap::Fault
        status(401) and return
      end

      if result
        YAML.dump(result.to_hash)
      else
        status(404)
      end
    end

    private

    # update a lock file that we use to track when the last query was proxied
    # through to the authoritive Titlepage API. 
    #
    # Updates the file and returns true if no query was made in the previous 3
    # seconds, otherwise doesn't update the file and returns false.
    #
    # Used to ensure we don't exceed the query limit.
    #
    def update_file
      if File.file?(TIMESTAMP_FILE)
        if Time.now.to_i - File.mtime(TIMESTAMP_FILE).to_i > 3
          File.open(TIMESTAMP_FILE, "w") { |of| of.write "titlepage timestamp"}
          true
        else
          false
        end
      else
        File.open(TIMESTAMP_FILE, "w") { |of| of.write "titlepage timestamp"}
        true
      end
    end
  end
end
