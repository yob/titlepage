require File.dirname(__FILE__) + '/titlepage_utils.rb'

require 'soap/rpc/driver'

module RBook
  module TitlePage
    class TitleQueryPortType < ::SOAP::RPC::Driver
      DefaultEndpointUrl = "http://www.titlepage.com.au/ws/TitleQuery.php"
      MappingRegistry = ::SOAP::Mapping::Registry.new

      MappingRegistry.set(
        SearchResults,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "SearchResults") }
      )
      MappingRegistry.set(
        Product,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Product") }
      )
      MappingRegistry.set(
        ArrayOfProductIdentifier,
        ::SOAP::SOAPArray,
        ::SOAP::Mapping::Registry::TypedArrayFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "ProductIdentifier") }
      )
      MappingRegistry.set(
        Title,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Title") }
      )
      MappingRegistry.set(
        ArrayOfContributor,
        ::SOAP::SOAPArray,
        ::SOAP::Mapping::Registry::TypedArrayFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Contributor") }
      )
      MappingRegistry.set(
        SupplyDetail,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "SupplyDetail") }
      )
      MappingRegistry.set(
        Stock,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Stock") }
      )
      MappingRegistry.set(
        Price,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Price") }
      )
      MappingRegistry.set(
        ProductIdentifier,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "ProductIdentifier") }
      )
      MappingRegistry.set(
        Contributor,
        ::SOAP::SOAPStruct,
        ::SOAP::Mapping::Registry::TypedStructFactory,
        { :type => XSD::QName.new("urn:TitleQuery", "Contributor") }
      )

      Methods = [
        [ XSD::QName.new("http://www.titlepage.com/ws", "Login"),
          "http://www.titlepage.com.au/ws/TitleQuery.php/Login",
          "login",
          [ ["in", "UserName", ["::SOAP::SOAPString"]],
            ["in", "Password", ["::SOAP::SOAPString"]],
            ["retval", "Token", ["::SOAP::SOAPString"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded }
        ],
        [ XSD::QName.new("http://www.titlepage.com/ws", "SearchByISBN"),
          "http://www.titlepage.com.au/ws/TitleQuery.php/SearchByISBN",
          "searchByISBN",
          [ ["in", "Token", ["::SOAP::SOAPString"]],
            ["in", "ISBN", ["::SOAP::SOAPString"]],
            ["retval", "SearchResults", ["SearchResults", "urn:TitleQuery", "SearchResults"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded }
        ],
        [ XSD::QName.new("http://www.titlepage.com/ws", "SearchByEAN"),
          "http://www.titlepage.com.au/ws/TitleQuery.php/SearchByEAN",
          "searchByEAN",
          [ ["in", "Token", ["::SOAP::SOAPString"]],
            ["in", "EAN", ["::SOAP::SOAPString"]],
            ["retval", "SearchResults", ["SearchResults", "urn:TitleQuery", "SearchResults"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded }
        ],
        [ XSD::QName.new("http://www.titlepage.com/ws", "Logout"),
          "http://www.titlepage.com.au/ws/TitleQuery.php/Logout",
          "logout",
          [ ["in", "token", ["::SOAP::SOAPString"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded }
        ]
      ]

      def initialize(endpoint_url = nil)
        endpoint_url ||= DefaultEndpointUrl
        super(endpoint_url, nil)
        self.mapping_registry = MappingRegistry
        init_methods
      end

    private

      def init_methods
        Methods.each do |definitions|
          opt = definitions.last
          if opt[:request_style] == :document
            add_document_operation(*definitions)
          else
            add_rpc_operation(*definitions)
            qname = definitions[0]
            name = definitions[2]
            if qname.name != name and qname.name.capitalize == name.capitalize
              ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
                __send__(name, *arg)
              end
            end
          end
        end
      end
    end
  end
end
