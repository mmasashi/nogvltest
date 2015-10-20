# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nogvltest/version'

Gem::Specification.new do |spec|
  spec.name          = "nogvltest"
  spec.version       = Nogvltest::VERSION
  spec.authors       = ["Masashi Miyazaki"]
  spec.email         = ["mmasashicom@gmail.com"]

  spec.summary       = %q{Test code running threads without GVL.}
  spec.description   = %q{Test code running threads without GVL using rb_thread_call_without_gvl.}
  spec.homepage      = "https://github.com/mmasashi/nogvltest"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://github.com/mmasashi/nogvltest'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/nogvltest/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec"
end
