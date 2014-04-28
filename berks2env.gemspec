# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "berks2env/version"

Gem::Specification.new do |s|
  s.name        = 'berks2env'
  s.version     = Berks2Env::VERSION
  s.authors     = ["Pete Cheslock"]
  s.email       = 'petecheslock@gmail.com'
  s.homepage    = 'https://github.com/petecheslock/berks2env'
  s.summary     = %q{Convert a Berkshelf Lockfile to a Chef Environment json}
  s.description = %q{Convert a Berkshelf Lockfile to a Chef Environment json}

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.license       = 'MIT'

  s.add_dependency("chef", ["~> 11.8"])
  s.add_dependency("json", ["~> 1.7.7"])
  s.add_dependency("berkshelf", ["~> 3.1"])
  s.add_development_dependency("rubocop", ["~> 0.21.0"])
end
