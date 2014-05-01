# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'berks2env/version'

Gem::Specification.new do |s|
  s.name        = 'berks2env'
  s.version     = Berks2Env::VERSION
  s.authors     = ['Pete Cheslock']
  s.email       = 'petecheslock@gmail.com'
  s.homepage    = 'https://github.com/petecheslock/berks2env'
  s.summary     = %q(Solve Berks Lock file to Environment)
  s.description = %q(Convert a Berkshelf Lockfile to a Chef Environment json)
  s.has_rdoc    = false
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_runtime_dependency('chef', ['~> 11.8'])
  s.add_runtime_dependency('json', ['~> 1.7', '>= 1.7.7'])
  s.add_runtime_dependency('berkshelf', ['~> 3.1'])
  s.add_development_dependency('rubocop', ['~> 0.21'])
  s.add_development_dependency('rake', ['~> 0'])
  s.add_development_dependency('rspec-core', ['~> 2.14.8'])
  s.add_development_dependency('rspec-mocks', ['~> 2.14.6'])
  s.add_development_dependency('rspec-expectations', ['~> 2.14.5'])
  s.add_development_dependency('rspec', ['~> 0'])

end
