require 'xsd/qname'

module TitlePage

  # {urn:TitleQuery}ProductIdentifier
  #   productIDType - SOAP::SOAPString
  #   iDValue - SOAP::SOAPString
  class ProductIdentifier
    attr_accessor :productIDType
    attr_accessor :iDValue

    def initialize(productIDType = nil, iDValue = nil)
      @productIDType = productIDType
      @iDValue = iDValue
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}Title
  #   titleType - SOAP::SOAPString
  #   titleText - SOAP::SOAPString
  #   titlePrefix - SOAP::SOAPString
  #   titleWithoutPrefix - SOAP::SOAPString
  #   subtitle - SOAP::SOAPString
  class Title
    attr_accessor :titleType
    attr_accessor :titleText
    attr_accessor :titlePrefix
    attr_accessor :titleWithoutPrefix
    attr_accessor :subtitle

    def initialize(titleType = nil, titleText = nil, titlePrefix = nil, titleWithoutPrefix = nil, subtitle = nil)
      @titleType = titleType
      @titleText = titleText
      @titlePrefix = titlePrefix
      @titleWithoutPrefix = titleWithoutPrefix
      @subtitle = subtitle
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}Contributor
  #   sequenceNumber - SOAP::SOAPInteger
  #   contributorRole - SOAP::SOAPString
  #   personName - SOAP::SOAPString
  #   personNameInverted - SOAP::SOAPString
  #   titlesBeforeNames - SOAP::SOAPString
  #   keyNames - SOAP::SOAPString
  class Contributor
    attr_accessor :sequenceNumber
    attr_accessor :contributorRole
    attr_accessor :personName
    attr_accessor :personNameInverted
    attr_accessor :titlesBeforeNames
    attr_accessor :keyNames

    def initialize(sequenceNumber = nil, contributorRole = nil, personName = nil, personNameInverted = nil, titlesBeforeNames = nil, keyNames = nil)
      @sequenceNumber = sequenceNumber
      @contributorRole = contributorRole
      @personName = personName
      @personNameInverted = personNameInverted
      @titlesBeforeNames = titlesBeforeNames
      @keyNames = keyNames
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}Stock
  #   onHand - SOAP::SOAPString
  #   onOrder - SOAP::SOAPString
  class Stock
    attr_accessor :onHand
    attr_accessor :onOrder

    def initialize(onHand = nil, onOrder = nil)
      @onHand = onHand
      @onOrder = onOrder
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}Price
  #   priceTypeCode - SOAP::SOAPString
  #   priceAmount - SOAP::SOAPDecimal
  class Price
    attr_accessor :priceTypeCode
    attr_accessor :priceAmount

    def initialize(priceTypeCode = nil, priceAmount = nil)
      @priceTypeCode = priceTypeCode
      @priceAmount = priceAmount
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}SupplyDetail
  #   supplierName - SOAP::SOAPString
  #   supplierRole - SOAP::SOAPString
  #   productAvailability - SOAP::SOAPString
  #   expectedShipDate - SOAP::SOAPString
  #   stock - TitlePage::Stock
  #   packQuantity - SOAP::SOAPInteger
  #   price - TitlePage::Price
  class SupplyDetail
    attr_accessor :supplierName
    attr_accessor :supplierRole
    attr_accessor :productAvailability
    attr_accessor :expectedShipDate
    attr_accessor :stock
    attr_accessor :packQuantity
    attr_accessor :price

    def initialize(supplierName = nil, supplierRole = nil, productAvailability = nil, expectedShipDate = nil, stock = nil, packQuantity = nil, price = nil)
      @supplierName = supplierName
      @supplierRole = supplierRole
      @productAvailability = productAvailability
      @expectedShipDate = expectedShipDate
      @stock = stock
      @packQuantity = packQuantity
      @price = price
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}Product
  #   productIdentifiers - TitlePage::ArrayOfProductIdentifier
  #   title - TitlePage::Title
  #   contributors - TitlePage::ArrayOfContributor
  #   supplyDetail - TitlePage::SupplyDetail
  class Product
    attr_accessor :productIdentifiers
    attr_accessor :title
    attr_accessor :contributors
    attr_accessor :supplyDetail

    def initialize(productIdentifiers = nil, title = nil, contributors = nil, supplyDetail = nil)
      @productIdentifiers = productIdentifiers
      @title = title
      @contributors = contributors
      @supplyDetail = supplyDetail
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}SearchResults
  #   iSBN - SOAP::SOAPString
  #   eAN - SOAP::SOAPString
  #   iSBN13 - SOAP::SOAPString
  #   product - TitlePage::Product
  class SearchResults
    attr_accessor :iSBN
    attr_accessor :eAN
    attr_accessor :iSBN13
    attr_accessor :product

    def initialize(iSBN = nil, eAN = nil, iSBN13 = nil, product = nil)
      @iSBN = iSBN
      @eAN = eAN
      @iSBN13 = iSBN13
      @product = product
    end

    # convenience method
    #
    def Product
      @product
    end

    # An older version of soap4r that was used to generate boilerplate code
    # in versions of this gem <= 0.9.3 created methods that started with
    # capitals. Detect when some code calls these old method names and
    # print a deprecation warning.
    def method_missing(method, *arguments)
      new_method = method.to_s[0,1].downcase
      new_method << method.to_s[1,20]

      if self.respond_to?(new_method)
        $stderr.puts "Warning: #{method} is deprecated. Use #{new_method} instead"
        self.send(new_method, *arguments)
      else
        super
      end
    end
  end

  # {urn:TitleQuery}ArrayOfContributor
  class ArrayOfContributor < ::Array
  end

  # {urn:TitleQuery}ArrayOfProductIdentifier
  class ArrayOfProductIdentifier < ::Array
  end

end
