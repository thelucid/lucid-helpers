$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "lucid/helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "lucid-helpers"
  spec.version     = Lucid::Helpers::VERSION
  spec.authors     = ["Jamie Hill"]
  spec.email       = ["jamie@thelucid.com"]
  spec.homepage    = "http://thelucid.com"
  spec.summary     = "A set of Rails helpers that we use at SonicIQ to aid in development."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"

  spec.add_development_dependency "sqlite3"
end
