module Retailigence

  class Retailer < Retailigence::Base
    
    def self.search(params={})
      params = {latitude: 27.6,
        longitude: -82.5,
        range: 40,
        units: 'k'}.merge!(params)
        
      perform_graph_request('retailers', params)
    end

  end
  
end
