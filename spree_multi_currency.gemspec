# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_multi_currency'
  s.version     = '2.0.7'
  s.summary     = 'Spree Commerce Extension - Provide currency customization'
  s.description = 'http://www.spreecommerce.com'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Gregor MacDougall'
  s.email     = 'gmacdougall@freerunningtechnologies.com'
  s.homepage  = 'http://www.freerunningtechnologies.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '~> 2.0.7'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_frontend', spree_version
  s.add_dependency 'spree_backend', spree_version

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
