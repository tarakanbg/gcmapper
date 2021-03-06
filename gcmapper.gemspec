# frozen_string_literal: true

require File.expand_path('lib/gcmapper/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['Svilen Vassilev']
  gem.email         = ['svilen@rubystudio.net']
  gem.description   = 'Easily generate Great Circle maps between 2 or more
                       airports. The gem provides an API for constructing the
                       image URLs, the maps themselves are pulled from
                       gcmap.com.'
  gem.summary       = 'A Ruby gem for easy generation of Great Circle Map images'
  gem.homepage      = 'https://github.com/tarakanbg/gcmapper'

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'gcmapper'
  gem.require_paths = ['lib']
  gem.version       = Gcmapper::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
