Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_google_merchant'
  s.version     = '2.3.1'
  s.summary     = 'Add gem summary here'
  s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.23'
  s.author            = 'Renuo GmbH, Sam T, Seb Weston'
  s.email             = 'info@renuo.ch, samtreweek@gmail.com, sebweston@gmail.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 2.3.0')
end
