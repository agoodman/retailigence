$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "retailigence/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "retailigence"
  s.version     = Retailigence::VERSION
  s.authors     = ["Aubrey Goodman"]
  s.email       = ["aubrey.goodman@gmail.com"]
  s.homepage    = "http://retailigence.com"
  s.summary     = "Retailigence API"
  s.description = "Ruby wrapper for the Retailigence API"

  s.files = Dir["{lib}/**/*"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "activeresource", "~> 3.2.6"
  s.add_dependency "nori", "~>1.1.3"
end
