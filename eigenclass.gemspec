Gem::Specification.new do |s| 
  s.name    = 'eigenclass'
  s.version = '1.1.0'
  s.date    = '2010-01-28'
  
  s.summary     = "Utility methods for modifying a ruby object's eigenclass/metaclass"
  s.description = "Utility methods for modifying a ruby object's eigenclass/metaclass"
  
  s.author   = 'Sean Huber'
  s.email    = 'shuber@huberry.com'
  s.homepage = 'http://github.com/shuber/eigenclass'
  
  s.has_rdoc = false
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.rdoc']
  
  s.require_paths = ['lib']
  
  s.files = %w(
    lib/eigenclass.rb
    MIT-LICENSE
    Rakefile
    README.rdoc
    test/eigenclass_test.rb
  )
  
  s.test_files = %w(
    test/eigenclass_test.rb
  )
end