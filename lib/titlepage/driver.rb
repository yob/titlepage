module TitlePage
  class Driver < Handsoap::Service
    endpoint TitlePage::SERVICE_ENDPOINT

    # Login to the webservice. Accepts a username and password.
    #
    # Note that you can use the standard same username and password,
    # but the account needs to have API access activated first.
    #
    # Returns a string token that must be passed to all other methods.
    #
    def login(username, password)
      response = invoke("Login") do |message|
        message.add "UserName", username
        message.add "Password", password
      end
      response.document.xpath("//Token/text()").to_s
    end

    # logout from the webservice. The standard authentication token must be
    # provided.
    #
    # There is no useful return value
    #
    def logout(token)
      response = invoke("Logout") do |message|
        message.add "token", token
      end
      true
    end

    # search for products by ISBN10. The standard authentication token must be
    # provided along with the ISBN.
    #
    # Returns an array of results.
    #
    def search_by_isbn(token, isbn)
      response = invoke("SearchByISBN") do |message|
        message.add "Token", token
        message.add "ISBN", isbn
      end
      response.document.xpath("//SearchResults/Product").collect do |node|
        TitlePage::Product.from_xml(node)
      end
    end

    # search for products by ISBN13. The standard authentication token must be
    # provided along with the ISBN.
    #
    # Returns an array of results.
    #
    def search_by_isbn13(token, isbn)
      response = invoke("SearchByISBN13") do |message|
        message.add "Token", token
        message.add "ISBN13", isbn
      end
      response.document.xpath("//SearchResults/Product").collect do |node|
        TitlePage::Product.from_xml(node)
      end
    end

    # search for products by EAN. The standard authentication token must be
    # provided along with the ISBN.
    #
    # Returns an array of results.
    #
    # Note that although in theory EAN and ISBN13 are the same, many suppliers
    # don't include an explicit EAN in the ONIX files they provide Titlepage,
    # so it is nearly always preferable to search by ISBN13.
    #
    def search_by_ean(token, ean)
      response = invoke("SearchByEAN") do |message|
        message.add "Token", token
        message.add "EAN", ean
      end
      response.document.xpath("//SearchResults/Product").collect do |node|
        TitlePage::Product.from_xml(node)
      end
    end

  end
end
