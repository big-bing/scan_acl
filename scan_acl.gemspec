# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "scan_acl/version"

Gem::Specification.new do |spec|
  spec.name          = "scan_acl"
  spec.version       = ScanAcl::VERSION
  spec.authors       = ["BigBing"]
  spec.email         = ["1075264520@qq.com"]

  spec.summary       = %q{private gem}
  spec.description   = %q{scan acl}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'activerecord'
end
