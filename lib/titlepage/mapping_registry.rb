require 'soap/mapping'

module TitlePage

  module DefaultMappingRegistry
    EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
    LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
    NsTitleQuery = "urn:TitleQuery"

    EncodedRegistry.register(
      :class => TitlePage::ProductIdentifier,
      :schema_type => XSD::QName.new(NsTitleQuery, "ProductIdentifier"),
      :schema_element => [
        ["productIDType", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductIDType")]],
        ["iDValue", ["SOAP::SOAPString", XSD::QName.new(nil, "IDValue")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::Title,
      :schema_type => XSD::QName.new(NsTitleQuery, "Title"),
      :schema_element => [
        ["titleType", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleType")]],
        ["titleText", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleText")]],
        ["titlePrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlePrefix")]],
        ["titleWithoutPrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleWithoutPrefix")]],
        ["subtitle", ["SOAP::SOAPString", XSD::QName.new(nil, "Subtitle")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::Contributor,
      :schema_type => XSD::QName.new(NsTitleQuery, "Contributor"),
      :schema_element => [
        ["sequenceNumber", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SequenceNumber")]],
        ["contributorRole", ["SOAP::SOAPString", XSD::QName.new(nil, "ContributorRole")]],
        ["personName", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonName")]],
        ["personNameInverted", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonNameInverted")]],
        ["titlesBeforeNames", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlesBeforeNames")]],
        ["keyNames", ["SOAP::SOAPString", XSD::QName.new(nil, "KeyNames")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::Stock,
      :schema_type => XSD::QName.new(NsTitleQuery, "Stock"),
      :schema_element => [
        ["onHand", ["SOAP::SOAPString", XSD::QName.new(nil, "OnHand")]],
        ["onOrder", ["SOAP::SOAPString", XSD::QName.new(nil, "OnOrder")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::Price,
      :schema_type => XSD::QName.new(NsTitleQuery, "Price"),
      :schema_element => [
        ["priceTypeCode", ["SOAP::SOAPString", XSD::QName.new(nil, "PriceTypeCode")]],
        ["priceAmount", ["SOAP::SOAPDecimal", XSD::QName.new(nil, "PriceAmount")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::SupplyDetail,
      :schema_type => XSD::QName.new(NsTitleQuery, "SupplyDetail"),
      :schema_element => [
        ["supplierName", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierName")]],
        ["supplierRole", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierRole")]],
        ["productAvailability", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductAvailability")]],
        ["expectedShipDate", ["SOAP::SOAPString", XSD::QName.new(nil, "ExpectedShipDate")]],
        ["stock", ["TitlePage::Stock", XSD::QName.new(nil, "Stock")]],
        ["packQuantity", ["SOAP::SOAPInteger", XSD::QName.new(nil, "PackQuantity")]],
        ["price", ["TitlePage::Price", XSD::QName.new(nil, "Price")]]
    ]
    )

    EncodedRegistry.set(
      TitlePage::ArrayOfContributor,
      ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new(NsTitleQuery, "Contributor") }
    )

    EncodedRegistry.set(
      TitlePage::ArrayOfProductIdentifier,
      ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new(NsTitleQuery, "ProductIdentifier") }
    )

    EncodedRegistry.register(
      :class => TitlePage::Product,
      :schema_type => XSD::QName.new(NsTitleQuery, "Product"),
      :schema_element => [
        ["productIdentifiers", ["TitlePage::ArrayOfProductIdentifier", XSD::QName.new(nil, "ProductIdentifiers")]],
        ["title", ["TitlePage::Title", XSD::QName.new(nil, "Title")]],
        ["contributors", ["TitlePage::ArrayOfContributor", XSD::QName.new(nil, "Contributors")]],
        ["supplyDetail", ["TitlePage::SupplyDetail", XSD::QName.new(nil, "SupplyDetail")]]
    ]
    )

    EncodedRegistry.register(
      :class => TitlePage::SearchResults,
      :schema_type => XSD::QName.new(NsTitleQuery, "SearchResults"),
      :schema_element => [
        ["iSBN", ["SOAP::SOAPString", XSD::QName.new(nil, "ISBN")]],
        ["eAN", ["SOAP::SOAPString", XSD::QName.new(nil, "EAN")]],
        ["iSBN13", ["SOAP::SOAPString", XSD::QName.new(nil, "ISBN13")]],
        ["product", ["TitlePage::Product", XSD::QName.new(nil, "Product")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::ProductIdentifier,
      :schema_type => XSD::QName.new(NsTitleQuery, "ProductIdentifier"),
      :schema_element => [
        ["productIDType", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductIDType")]],
        ["iDValue", ["SOAP::SOAPString", XSD::QName.new(nil, "IDValue")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::Title,
      :schema_type => XSD::QName.new(NsTitleQuery, "Title"),
      :schema_element => [
        ["titleType", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleType")]],
        ["titleText", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleText")]],
        ["titlePrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlePrefix")]],
        ["titleWithoutPrefix", ["SOAP::SOAPString", XSD::QName.new(nil, "TitleWithoutPrefix")]],
        ["subtitle", ["SOAP::SOAPString", XSD::QName.new(nil, "Subtitle")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::Contributor,
      :schema_type => XSD::QName.new(NsTitleQuery, "Contributor"),
      :schema_element => [
        ["sequenceNumber", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SequenceNumber")]],
        ["contributorRole", ["SOAP::SOAPString", XSD::QName.new(nil, "ContributorRole")]],
        ["personName", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonName")]],
        ["personNameInverted", ["SOAP::SOAPString", XSD::QName.new(nil, "PersonNameInverted")]],
        ["titlesBeforeNames", ["SOAP::SOAPString", XSD::QName.new(nil, "TitlesBeforeNames")]],
        ["keyNames", ["SOAP::SOAPString", XSD::QName.new(nil, "KeyNames")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::Stock,
      :schema_type => XSD::QName.new(NsTitleQuery, "Stock"),
      :schema_element => [
        ["onHand", ["SOAP::SOAPString", XSD::QName.new(nil, "OnHand")]],
        ["onOrder", ["SOAP::SOAPString", XSD::QName.new(nil, "OnOrder")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::Price,
      :schema_type => XSD::QName.new(NsTitleQuery, "Price"),
      :schema_element => [
        ["priceTypeCode", ["SOAP::SOAPString", XSD::QName.new(nil, "PriceTypeCode")]],
        ["priceAmount", ["SOAP::SOAPDecimal", XSD::QName.new(nil, "PriceAmount")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::SupplyDetail,
      :schema_type => XSD::QName.new(NsTitleQuery, "SupplyDetail"),
      :schema_element => [
        ["supplierName", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierName")]],
        ["supplierRole", ["SOAP::SOAPString", XSD::QName.new(nil, "SupplierRole")]],
        ["productAvailability", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductAvailability")]],
        ["expectedShipDate", ["SOAP::SOAPString", XSD::QName.new(nil, "ExpectedShipDate")]],
        ["stock", ["TitlePage::Stock", XSD::QName.new(nil, "Stock")]],
        ["packQuantity", ["SOAP::SOAPInteger", XSD::QName.new(nil, "PackQuantity")]],
        ["price", ["TitlePage::Price", XSD::QName.new(nil, "Price")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::Product,
      :schema_type => XSD::QName.new(NsTitleQuery, "Product"),
      :schema_element => [
        ["productIdentifiers", ["TitlePage::ArrayOfProductIdentifier", XSD::QName.new(nil, "ProductIdentifiers")]],
        ["title", ["TitlePage::Title", XSD::QName.new(nil, "Title")]],
        ["contributors", ["TitlePage::ArrayOfContributor", XSD::QName.new(nil, "Contributors")]],
        ["supplyDetail", ["TitlePage::SupplyDetail", XSD::QName.new(nil, "SupplyDetail")]]
    ]
    )

    LiteralRegistry.register(
      :class => TitlePage::SearchResults,
      :schema_type => XSD::QName.new(NsTitleQuery, "SearchResults"),
      :schema_element => [
        ["iSBN", ["SOAP::SOAPString", XSD::QName.new(nil, "ISBN")]],
        ["eAN", ["SOAP::SOAPString", XSD::QName.new(nil, "EAN")]],
        ["iSBN13", ["SOAP::SOAPString", XSD::QName.new(nil, "ISBN13")]],
        ["product", ["TitlePage::Product", XSD::QName.new(nil, "Product")]]
    ]
    )
  end

end
