Gem::Specification.new do |s| 
  s.name    = 'eigenclass'
  s.version = '1.0.1'
  s.date    = '2009-01-07'
  
  s.summary     = "Utility methods for modifying a ruby object's eigenclass/metaclass"
  s.description = "Utility methods for modifying a ruby object's eigenclass/metaclass"
  
  s.author   = 'Sean Huber'
  s.email    = 'shuber@huberry.com'
  s.homepage = 'http://github.com/shuber/eigenclass'
  
  s.has_rdoc = false
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.markdown']
  
  s.require_paths = ['lib']
  
  s.files = %w(
    CHANGELOG
    lib/eigenclass.rb
    MIT-LICENSE
    Rakefile
    README.markdown
  )
  
  s.test_files = %w(
    test/eigenclass_test.rb
  )
end