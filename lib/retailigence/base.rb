module Retailigence

  class Base < ActiveResource::Base
    
    self.site = "http://apitest.retailigence.com/v1.2/"
    self.format = ActiveResource::Formats::XmlFormat
    
    def self.apikey=(key)
      @@apikey = key
    end
    
    def self.apikey
      @@apikey
    end

    def self.perform_graph_request(endpoint, params={}, method="get")
      require 'net/http'
      require 'nori'

      @query_string = "?"
      @query_string += "apikey=#{apikey}"

      if method=="get"
        params.each{|key, val| @query_string += "&#{key}=#{val}"}
        url = URI.parse("#{self.site}#{endpoint}#{@query_string}")
        request = Net::HTTP::Get.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/xml"})
      else
        url = URI.parse("#{self.site}#{endpoint}#{@query_string}")
        request = Net::HTTP::Post.new("#{url.path}?#{url.query}",{"Content-Type"=>"text/xml"})
        request.set_form_data(params)
      end

      http = Net::HTTP.new(url.host, url.port)
      # http.use_ssl = true
      response = ::Nori.parse(http.start {|http| http.request(request)}.body)
      response
    end
  end
  
end
