require "rake/gempackagetask"

spec = Gem::Specification.new do |s|
  s.name         = "ariete"
  s.summary      = "Ariete STDOUT & STDERR Capture Module."
  s.description  = File.read(File.join(File.dirname(__FILE__), "README.md"))
  s.version      = "0.1.0"
  s.author       = "Moza USANE"
  s.email        = "mozamimy@quellencode.org"
  s.homepage     = "http://quellencode.org/"
  s.platform     = Gem::Platform::RUBY
  s.required_ruby_version = ">=1.9"
  s.files        = Dir["**/**"]
  s.test_files   = Dir["test/test*.rb"]
  s.has_rdoc     = true
end

Rake::GemPackageTask.new(spec).define
