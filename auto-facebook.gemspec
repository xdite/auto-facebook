# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto/facebook/version'

Gem::Specification.new do |gem|
  gem.name          = "auto-facebook"
  gem.version       = AutoFacebook::VERSION
  gem.authors       = ["xdite"]
  gem.email         = ["xdite@rocodev.com"]
  gem.description   = %q{Auto Mount Facebook Login}
  gem.summary       = %q{Auto Mount Facebook Login}
  gem.homepage      = "http://github.com/xdite/auto-facebook"

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-facebook'
  gem.add_dependency 'rails', '4.0.0'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
