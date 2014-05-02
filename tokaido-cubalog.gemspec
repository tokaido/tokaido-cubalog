# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tokaido/cubalog/version'

Gem::Specification.new do |gem|
  gem.name          = "tokaido-cubalog"
  gem.version       = Tokaido::Cubalog::VERSION
  gem.authors       = ["Andrés N. Robalino"]
  gem.email         = ["androb@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "cuba"
  gem.add_dependency "puma"
  gem.add_dependency "tilt"
end
