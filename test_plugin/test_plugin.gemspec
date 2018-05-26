$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "test_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "test_plugin"
  s.version     = TestPlugin::VERSION
  s.authors     = ["MrPibol"]
  s.email       = ["mr.jp.torres@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TestPlugin."
  s.description = "TODO: Description of TestPlugin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.6"

  s.add_development_dependency "sqlite3"
  # s.add_dependency 'ranked-model'  
  
  
end
