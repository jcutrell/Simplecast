# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecast/version'

Gem::Specification.new do |spec|
  spec.name          = "simplecast"
  spec.version       = Simplecast::VERSION
  spec.authors       = ["Jonathan Cutrell"]
  spec.email         = ["jonathan@whiteboard.is"]
  spec.summary       = %q{Simple wrapper for Simplecast podcasting service.}
  #spec.description   = %q{}
  spec.homepage      = "https://github.com/jcutrell/Simplecast"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "hurley", "~> 0.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
