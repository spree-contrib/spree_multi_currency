# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_multi_currency/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_multi_currency'
  s.version     = SpreeMultiCurrency.version
  s.summary     = 'Provide currency customization for Spree Commerce.'
  s.description = s.summary
  s.required_ruby_version = '>= 2.2.4'

  s.authors   = ['Gregor MacDougall', 'Spree Community']
  s.email     = ['gmacdougall@freerunningtechnologies.com', 'gems@spreecommerce.com']
  s.homepage  = 'https://github.com/spree-contrib/spree_multi_currency'
  s.license   = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'spree_backend', '>= 3.1.0', '< 4.0'
  s.add_runtime_dependency 'spree_extension'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_bot', '~> 4.7'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'mysql2', '~> 0.3.18'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'pg', '~> 0.18'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
end
