# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gooddata/bricks/version'

Gem::Specification.new do |spec|
  spec.name          = "gooddata-bricks-poc"
  spec.version       = Gooddata::Bricks::VERSION
  spec.authors       = ["Tomas Svarovsky"]
  spec.email         = ["svarovsky.tomas@gmail.com"]
  spec.description   = %q{Simple example how the brick might look like. It is just a POC}
  spec.summary       = %q{This is a brief summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "rest-client"
  spec.add_dependency "gooddata"
end
