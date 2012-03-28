$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_sitemap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_sitemap"
  s.version     = SpreeSitemap::VERSION
  s.authors     = ["Tim Neems"]
  s.email       = ["tneems@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "Sitemaps for Spree Commerce."
  s.description = "Sitemaps for Spree Commerce."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "spree_core", "~> 1.0.0"

  s.add_development_dependency 'rspec-rails', '~> 2.8.0'
  s.add_development_dependency 'factory_girl_rails', '~> 1.7.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency "sqlite3"
end
