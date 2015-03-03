require File.expand_path('../lib/eigenclass/version', __FILE__)

Gem::Specification.new do |s| 
  s.name    = 'eigenclass'
  s.version = Eigenclass::VERSION
  s.date    = '2010-01-28'
  
  s.summary     = 'Eigenclasses in ruby'
  s.description = 'Eigenclasses (aka metaclasses or singleton classes) in ruby'
  
  s.author   = 'Sean Huber'
  s.email    = 'github@shuber.io'
  s.homepage = 'https://github.com/shuber/eigenclass'
  
  s.has_rdoc = false
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.rdoc']
  
  s.require_paths = ['lib']
  
  s.files = %w(
    lib/eigenclass.rb
    LICENSE
    Rakefile
    README.rdoc
    test/eigenclass_test.rb
  )
  
  s.test_files = %w(
    test/eigenclass_test.rb
  )

  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
end
