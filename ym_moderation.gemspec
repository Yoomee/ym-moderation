$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_moderation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_moderation"
  s.version     = YmModeration::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Edward Andrews-Hodgson"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "edward@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "Summary of YmModeration."
  s.description = "Description of YmModeration."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_dependency 'ym_core', '~> 1.0'
  s.add_dependency "ym_users", "~> 1.0"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'capybara', '~> 1.1.0'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'geminabox'
  s.add_development_dependency 'ym_tools', '~> 1.0.0'
  s.add_development_dependency 'listen', '~> 1.3.1'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'database_cleaner', '1.2.0'

end