require 'xsd/qname'

module TitlePage

  # {urn:TitleQuery}ProductIdentifier
  class ProductIdentifier
    @@schema_type = "ProductIdentifier"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["productIDType", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductIDType")]], ["iDValue", ["SOAP::SOAPString", XSD::QName.new(nil, "IDValue")]]]

    def ProductIDType
      @productIDType
    end

    def ProductIDType=(value)
      @productIDType = value
    end

    def IDValue
      @iDValue
    end

    def IDValue=(value)
      @iDValue = value
    end

    def initialize(productIDType = nil, iDValue = nil)
      @productIDType = productIDType
      @iDValue = iDValue
    end
  end

  # {urn:TitleQuery}Title
  class Title
    @@schema_type = "Title"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["titleType", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleType")]], ["titleText", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleText")]], ["titlePrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlePrefix")]], ["titleWithoutPrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleWithoutPrefix")]], ["subtitle", ["SOAP::SOAPString", XSD::QName.new(nil, "Subtitle")]]]

    def TitleType
      @titleType
    end

    def TitleType=(value)
      @titleType = value
    end

    def TitleText
      @titleText
    end

    def TitleText=(value)
      @titleText = value
    end

    def TitlePrefix
      @titlePrefix
    end

    def TitlePrefix=(value)
      @titlePrefix = value
    end

    def TitleWithoutPrefix
      @titleWithoutPrefix
    end

    def TitleWithoutPrefix=(value)
      @titleWithoutPrefix = value
    end

    def Subtitle
      @subtitle
    end

    def Subtitle=(value)
      @subtitle = value
    end

    def initialize(titleType = nil, titleText = nil, titlePrefix = nil, titleWithoutPrefix = nil, subtitle = nil)
      @titleType = titleType
      @titleText = titleText
      @titlePrefix = titlePrefix
      @titleWithoutPrefix = titleWithoutPrefix
      @subtitle = subtitle
    end
  end

  # {urn:TitleQuery}Contributor
  class Contributor
    @@schema_type = "Contributor"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["sequenceNumber", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SequenceNumber")]], ["contributorRole", ["SOAP::SOAPString", XSD::QName.new(nil, "ContributorRole")]], ["personName", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonName")]], ["personNameInverted", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonNameInverted")]], ["titlesBeforeNames", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlesBeforeNames")]], ["keyNames", ["SOAP::SOAPString", XSD::QName.new(nil, "KeyNames")]]]

    def SequenceNumber
      @sequenceNumber
    end

    def SequenceNumber=(value)
      @sequenceNumber = value
    end

    def ContributorRole
      @contributorRole
    end

    def ContributorRole=(value)
      @contributorRole = value
    end

    def PersonName
      @personName
    end

    def PersonName=(value)
      @personName = value
    end

    def PersonNameInverted
      @personNameInverted
    end

    def PersonNameInverted=(value)
      @personNameInverted = value
    end

    def TitlesBeforeNames
      @titlesBeforeNames
    end

    def TitlesBeforeNames=(value)
      @titlesBeforeNames = value
    end

    def KeyNames
      @keyNames
    end

    def KeyNames=(value)
      @keyNames = value
    end

    def initialize(sequenceNumber = nil, contributorRole = nil, personName = nil, personNameInverted = nil, titlesBeforeNames = nil, keyNames = nil)
      @sequenceNumber = sequenceNumber
      @contributorRole = contributorRole
      @personName = personName
      @personNameInverted = personNameInverted
      @titlesBeforeNames = titlesBeforeNames
      @keyNames = keyNames
    end
  end

  # {urn:TitleQuery}Stock
  class Stock
    @@schema_type = "Stock"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["onHand", ["SOAP::SOAPString", XSD::QName.new(nil, "OnHand")]], ["onOrder", ["SOAP::SOAPString", XSD::QName.new(nil, "OnOrder")]]]

    def OnHand
      @onHand
    end

    def OnHand=(value)
      @onHand = value
    end

    def OnOrder
      @onOrder
    end

    def OnOrder=(value)
      @onOrder = value
    end

    def initialize(onHand = nil, onOrder = nil)
      @onHand = onHand
      @onOrder = onOrder
    end
  end

  # {urn:TitleQuery}Price
  class Price
    @@schema_type = "Price"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["priceTypeCode", ["SOAP::SOAPString", XSD::QName.new(nil, "PriceTypeCode")]], ["priceAmount", ["SOAP::SOAPDecimal", XSD::QName.new(nil, "PriceAmount")]]]

    def PriceTypeCode
      @priceTypeCode
    end

    def PriceTypeCode=(value)
      @priceTypeCode = value
    end

    def PriceAmount
      @priceAmount
    end

    def PriceAmount=(value)
      @priceAmount = value
    end

    def initialize(priceTypeCode = nil, priceAmount = nil)
      @priceTypeCode = priceTypeCode
      @priceAmount = priceAmount
    end
  end

  # {urn:TitleQuery}SupplyDetail
  class SupplyDetail
    @@schema_type = "SupplyDetail"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["supplierName", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierName")]], ["supplierRole", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierRole")]], ["productAvailability", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductAvailability")]], ["expectedShipDate", ["SOAP::SOAPString", XSD::QName.new(nil, "ExpectedShipDate")]], ["stock", ["Stock", XSD::QName.new(nil, "Stock")]], ["packQuantity", ["SOAP::SOAPInteger", XSD::QName.new(nil, "PackQuantity")]], ["price", ["Price", XSD::QName.new(nil, "Price")]]]

    def SupplierName
      @supplierName
    end

    def SupplierName=(value)
      @supplierName = value
    end

    def SupplierRole
      @supplierRole
    end

    def SupplierRole=(value)
      @supplierRole = value
    end

    def ProductAvailability
      @productAvailability
    end

    def ProductAvailability=(value)
      @productAvailability = value
    end

    def ExpectedShipDate
      @expectedShipDate
    end

    def ExpectedShipDate=(value)
      @expectedShipDate = value
    end

    def Stock
      @stock
    end

    def Stock=(value)
      @stock = value
    end

    def PackQuantity
      @packQuantity
    end

    def PackQuantity=(value)
      @packQuantity = value
    end

    def Price
      @price
    end

    def Price=(value)
      @price = value
    end

    def initialize(supplierName = nil, supplierRole = nil, productAvailability = nil, expectedShipDate = nil, stock = nil, packQuantity = nil, price = nil)
      @supplierName = supplierName
      @supplierRole = supplierRole
      @productAvailability = productAvailability
      @expectedShipDate = expectedShipDate
      @stock = stock
      @packQuantity = packQuantity
      @price = price
    end
  end

  # {urn:TitleQuery}ArrayOfContributor
  class ArrayOfContributor < ::Array
    @@schema_type = "Contributor"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["item", ["Contributor", XSD::QName.new(nil, "item")]]]
  end

  # {urn:TitleQuery}ArrayOfProductIdentifier
  class ArrayOfProductIdentifier < ::Array
    @@schema_type = "ProductIdentifier"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["item", ["ProductIdentifier", XSD::QName.new(nil, "item")]]]
  end

  # {urn:TitleQuery}Product
  class Product
    @@schema_type = "Product"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["productIdentifiers", ["ArrayOfProductIdentifier", XSD::QName.new(nil, "ProductIdentifiers")]], ["title", ["Title", XSD::QName.new(nil, "Title")]], ["contributors", ["ArrayOfContributor", XSD::QName.new(nil, "Contributors")]], ["supplyDetail", ["SupplyDetail", XSD::QName.new(nil, "SupplyDetail")]]]

    def ProductIdentifiers
      @productIdentifiers
    end

    def ProductIdentifiers=(value)
      @productIdentifiers = value
    end

    def Title
      @title
    end

    def Title=(value)
      @title = value
    end

    def Contributors
      @contributors
    end

    def Contributors=(value)
      @contributors = value
    end

    def SupplyDetail
      @supplyDetail
    end

    def SupplyDetail=(value)
      @supplyDetail = value
    end

    def initialize(productIdentifiers = nil, title = nil, contributors = nil, supplyDetail = nil)
      @productIdentifiers = productIdentifiers
      @title = title
      @contributors = contributors
      @supplyDetail = supplyDetail
    end
  end

  # {urn:TitleQuery}SearchResults
  class SearchResults
    @@schema_type = "SearchResults"
    @@schema_ns = "urn:TitleQuery"
    @@schema_element = [["iSBN", ["SOAP::SOAPString", XSD::QName.new(nil, "ISBN")]], ["eAN", ["SOAP::SOAPString", XSD::QName.new(nil, "EAN")]], ["product", ["Product", XSD::QName.new(nil, "Product")]]]

    def ISBN
      @iSBN
    end

    def ISBN=(value)
      @iSBN = value
    end

    def EAN
      @eAN
    end

    def EAN=(value)
      @eAN = value
    end

    def Product
      @product
    end

    def Product=(value)
      @product = value
    end

    def initialize(iSBN = nil, eAN = nil, product = nil)
      @iSBN = iSBN
      @eAN = eAN
      @product = product
    end
  end
end
