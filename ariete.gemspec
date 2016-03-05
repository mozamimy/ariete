lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ariete/version'

Gem::Specification.new do |spec|
  spec.name          = "ariete"
  spec.version       = Ariete::VERSION
  spec.authors       = ["Moza USANE"]
  spec.email         = ["mozamimy@quellencode.org"]
  spec.summary       = %q{Ariete is capturing module for STDOUT & STDERR.}
  spec.description   = %q{Ariete is capturing module for STDOUT & STDERR.}
  spec.homepage      = "http://quellencode.org/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
end
