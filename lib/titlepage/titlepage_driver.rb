require 'soap/rpc/driver'

module TitlePage
  class TitleQueryPortType < ::SOAP::RPC::Driver
    DefaultEndpointUrl = "http://www.titlepage.com.au/ws/TitleQuery.php"
    NsWs = "http://www.titlepage.com/ws"

    Methods = [
      [ XSD::QName.new(NsWs, "Login"),
        "http://www.titlepage.com.au/ws/TitleQuery.php/Login",
        "login",
        [ ["in", "UserName", ["::SOAP::SOAPString"]],
          ["in", "Password", ["::SOAP::SOAPString"]],
          ["retval", "Token", ["::SOAP::SOAPString"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded,
            :faults => {} }
    ],
      [ XSD::QName.new(NsWs, "SearchByISBN"),
        "http://www.titlepage.com.au/ws/TitleQuery.php/SearchByISBN",
        "searchByISBN",
        [ ["in", "Token", ["::SOAP::SOAPString"]],
          ["in", "ISBN", ["::SOAP::SOAPString"]],
          ["retval", "SearchResults", ["TitlePage::SearchResults", "urn:TitleQuery", "SearchResults"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded,
            :faults => {} }
    ],
      [ XSD::QName.new(NsWs, "SearchByISBN13"),
        "http://www.titlepage.com.au/ws/TitleQuery.php/SearchByISBN13",
        "searchByISBN13",
        [ ["in", "Token", ["::SOAP::SOAPString"]],
          ["in", "ISBN13", ["::SOAP::SOAPString"]],
          ["retval", "SearchResults", ["TitlePage::SearchResults", "urn:TitleQuery", "SearchResults"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded,
            :faults => {} }
    ],
      [ XSD::QName.new(NsWs, "SearchByEAN"),
        "http://www.titlepage.com.au/ws/TitleQuery.php/SearchByEAN",
        "searchByEAN",
        [ ["in", "Token", ["::SOAP::SOAPString"]],
          ["in", "EAN", ["::SOAP::SOAPString"]],
          ["retval", "SearchResults", ["TitlePage::SearchResults", "urn:TitleQuery", "SearchResults"]] ],
          { :request_style =>  :rpc, :request_use =>  :encoded,
            :response_style => :rpc, :response_use => :encoded,
            :faults => {} }
    ],
      [ XSD::QName.new(NsWs, "Logout"),
        "http://www.titlepage.com.au/ws/TitleQuery.php/Logout",
        "logout",
        [ ["in", "token", ["::SOAP::SOAPString"]] ],
        { :request_style =>  :rpc, :request_use =>  :encoded,
          :response_style => :rpc, :response_use => :encoded,
          :faults => {} }
    ]
    ]

    def initialize(endpoint_url = nil)
      endpoint_url ||= DefaultEndpointUrl
      super(endpoint_url, nil)
      self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
      self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
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
