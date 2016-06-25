# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rspec_shared_examples/version'

Gem::Specification.new do |spec|
  
  spec.name          = "rspec_shared_examples"
  spec.version       = RspecUtils::VERSION
  spec.authors       = ["Martin Beauvais"]
  spec.email         = ["mbeauv@gmail.com"]

  spec.summary       = "Contains generic code that can be used to test Rails app with RSpec."
  spec.description   = "At the present time, this gem contains a shared_example used throughout our codebase to ensure i18n is valid."
  spec.homepage      = "TBD"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency 'rspec'
  spec.add_dependency 'capybara'
  spec.add_dependency 'i18n'

end
