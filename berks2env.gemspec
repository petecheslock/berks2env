# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'berks2env/version'

Gem::Specification.new do |s|
  s.name        = 'berks2env'
  s.version     = Berks2Env::VERSION
  s.authors     = ['Pete Cheslock']
  s.email       = 'petecheslock@gmail.com'
  s.homepage    = 'https://github.com/petecheslock/berks2env'
  s.summary     = %q(Convert a Berkshelf Lockfile to a Chef Environment json)
  s.description = %q(Convert a Berkshelf Lockfile to a Chef Environment json)
  s.has_rdoc    = false
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency('chef', ['~> 11.8'])
  s.add_dependency('json', ['~> 1.7.7'])
  s.add_dependency('berkshelf', ['~> 3.1'])
  s.add_development_dependency('rubocop', ['~> 0.21.0'])
  s.add_development_dependency('rake')

end
