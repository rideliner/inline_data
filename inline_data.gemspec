# encoding: utf-8

require './inline_data/version'

Gem::Specification.new do |spec|
  spec.name          = 'inline_data'
  spec.version       = InlineData::VERSION
  spec.authors       = ['Nathan Currier']
  spec.email         = ['nathan.currier@gmail.com']
  spec.license       = 'MPL-2.0'

  spec.description   = 'Manage program data stored in the program itself'
  spec.summary       = 'Manage program data'
  spec.homepage      = 'https://github.com/rideliner/inline_data'
  spec.has_rdoc      = 'yard'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test|spec|features)/})
  spec.require_paths = ['lib']
end
