require 'retailigence/base'
require 'retailigence/product'
require 'retailigence/location'
require 'retailigence/retailer'

module Retailigence
  extend self
  
  def configure
    yield Retailigence::Base
  end
  
end
