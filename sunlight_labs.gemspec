# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sunlight_labs/version'

Gem::Specification.new do |gem|
  gem.name          = "sunlight_labs"
  gem.version       = SunlightLabs::VERSION
  gem.authors       = ["apurvis@lumoslabs.com"]
  gem.email         = ["apurvis@lumoslabs.com"]

  gem.summary       = %q{Faraday based Ruby wrapper for Sunlight Labs Congress API}
  gem.homepage      = "http://github.com/apurvis/sunlight_labs"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'require_all'
  gem.add_dependency 'virtus'

  gem.add_development_dependency "bundler", "~> 1.10"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec"
end
