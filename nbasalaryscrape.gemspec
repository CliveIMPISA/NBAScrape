$:.push File.expand_path("../lib", __FILE__)
require 'nbasalaryscrape/version'

Gem::Specification.new do |gem|
  gem.name        =  'nbasalaryscrape'
  gem.version     =  SalaryScraper::VERSION
  gem.executables << 'nbasalaryscrape'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'minitest-rg'
  gem.date        =  Date.today.to_s
  gem.summary     =  'NBA Player Salary extractor'
  gem.description =  'Extract Player Salary from Basketball-Reference.com'
  gem.authors     =  ['Clive Augstin, Amon Bazongo, Jevon McKenzie']
  gem.email       =  'augustinclive@hotmail.com'
  gem.files       =  `git ls-files`.split("\n")
  gem.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.homepage    =  'https://github.com/CliveIMPISA/nbasalaryscrape'
  gem.license     =  'MIT'
end
