# encoding: utf-8

module TitlePage

  # a convenience class for accessing the SOAP API for http://www.titlepage.com.
  # Uses boilerplate code generated by soap4r.
  #
  # You should be aware of any limits of query volume imposed by the provider - currently a
  # maximum of 30 queries per minute is permitted.
  #
  # For a basic usage overview, check out TitlePage
  class Client

    # Optional driver parameter allows an alternative SOAP driver to the default to be specified.
    # This is primarily for testing purposes and probably isn't useful to anyone in the real world.
    def initialize
      @driver = TitlePage::Driver.new
      @token  = nil
    end

    # login to the titlepage API.
    #
    def login(username, password)
      logout if @token
      @token = @driver.login(username, password)
      if @token
        return true
      else
        return false
      end
    end

    # logout from the titlepage API
    #
    def logout
      if @token
        @driver.logout(@token)
        @token = nil
      end
    end

    # Retrieve information on a specified ISBN. Can be an ISBN10 or ISBN13.
    #
    def find(type, isbn)
      case type
      when :first
        first(isbn)
      when :all
        all(isbn)
      else
        raise ArgumentError, "invalid type #{type}"
      end
    end

    def all(isbn)
      return NotLoggedInError, 'You must login to titlepage API before performing a search' unless @token
      isbn = RBook::ISBN::convert_to_isbn13(isbn)
      return nil if isbn.nil?
      @driver.search_by_isbn13(@token, isbn)
    end

    def first(isbn)
      all(isbn).first
    end

    def last(isbn)
      all(isbn).last
    end

    # a convenience method to make single queries to title page a little cleaner. 
    #
    #  result = TitlePage.find("username","password","9780091835132")
    #  puts result.inspect
    #
    def self.find(username, password, isbn)
      result = nil
      TitlePage::Client.open(username, password) do |tp|
        result = tp.find(isbn)
      end
      return result
    end

    # a convenience method to make queries to title page a little cleaner. This function
    # essentially calls the login and logout functions for you automatically.
    #
    #  TitlePage.open("username","password") do |tp|
    #    result = tp.find("9780091835132")
    #  end
    def self.open(username, password)

      tp = self.new

      begin
        tp.login(username, password)
        yield tp
      ensure
        tp.logout
      end
    end

  end
end
