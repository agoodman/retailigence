module Retailigence

  class Product < Retailigence::Base

    def self.search(params={})
      perform_graph_request('products', params)
    end

  end
  
end
