$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../")

require 'rbook/isbn'
require 'net/http'

module TitlePage

  # You should be aware of any limits of query volume imposed by the provider - currently a
  # maximum of 30 queries per minute is permitted.
  class WWWClient

    TITLEPAGE_DOMAIN = "www.titlepage.com"
    @@uri = nil

    def initialize
    end

    def get_onix_file(isbn)
      isbn = RBook::ISBN.convert_to_isbn13(isbn)
      raise ArgumentError, 'Invalid ISBN supplied' if isbn.nil?

      headers = { 'Cookie' => @cookie }

      login_response = Net::HTTP.start(TITLEPAGE_DOMAIN, 80) do |http|
        data = [
          "posted=yes",
          "quicksearch=#{isbn}",
          "qsrchby=ean",
            "detailed=Search"
        ].join("&")
        http.post('/results.php', data, headers)
      end
      regex = /onclick=\"bookPopUp\(\'(.+)\'\);\"/
        code = login_response.body.match(regex)
      if code.nil?
        return nil
      else
        code = code[1]
      end
      onix_file = Net::HTTP.start(TITLEPAGE_DOMAIN, 80) do |http|
        data = [
          "download=Download",
          "rr=#{code}"
        ].join("&")
        http.post('/detail.php', data, headers)
      end
      return onix_file.body
    end

    # login to the titlepage website.
    def login(username, password)
      login_response = Net::HTTP.start(TITLEPAGE_DOMAIN, 80) do |http|
        data = [
          "usr=#{username}",
          "pwd=#{password}",
          "login=Login"
        ].join("&")
        http.post('/index.php', data)
      end
      @cookie = login_response['set-cookie']
    end

    # logout from the titlepage API
    def logout
      if @cookie
        login_response = Net::HTTP.start(TITLEPAGE_DOMAIN, 80) do |http|
          http.get("/logout.php")
        end
        @cookie = nil
      end
    end

    # a convenience method to make queries to title page a little cleaner. This function
    # essentially calls the login and logout functions for you automatically.
    #
    #  RBook::TitlePage::WWWClient.open("username","password") do |tp|
    #    result = tp.get_onix_file("9780091835132")
    #  end
    def self.open(username, password)

      tp = self.new

      begin
        tp.login(username, password)

        yield(tp)

      ensure
        tp.logout
      end
    end

  end
end
