module Huberry
  module Eigenclass
    # Uses <tt>eigenclass_eval</tt> to define attr_accessors in an object's <tt>eigenclass</tt>
    # which can be called like a class methods
    #
    # Example
    #
    #   class User
    #     eattr_accessor :testing
    #   end
    #
    #   User.testing = true
    def eattr_accessor(*attrs)
      eigenclass_eval { attr_accessor *attrs }
    end
    
    # Uses <tt>eigenclass_eval</tt> to define attr_readers in an object's <tt>eigenclass</tt>
    # which can be called like a class methods
    #
    # Example
    #
    #   class User
    #     eattr_reader :testing
    #     @testing = true
    #   end
    #
    #   User.testing # returns true
    def eattr_reader(*attrs)
      eigenclass_eval { attr_reader *attrs }
    end
    
    # Uses <tt>eigenclass_eval</tt> to define attr_writers in an object's <tt>eigenclass</tt>
    # which can be called like a class methods
    #
    # Example
    #
    #   class User
    #     eattr_writer :testing
    #   end
    #
    #   User.testing = true
    def eattr_writer(*attrs)
      eigenclass_eval { attr_writer *attrs }
    end
    
    # Uses <tt>eigenclass_eval</tt> to define a method in an object's <tt>eigenclass</tt>
    # which can be called like a class method
    #
    # Example
    #
    #   User.class_eval do
    #     define_class_method 'testing' do
    #       'test'
    #     end
    #   end
    #
    #   User.testing # returns 'test'
    def define_class_method(name, &block)
      eigenclass_eval { define_method name, &block }
    end
    
    # Returns an object's eigenclass
    def eigenclass
      class << self; self; end
    end
    
    # Accepts a block to evaluate inside the scope of an object's <tt>eigenclass</tt>
    #
    # Example
    #
    #   User.eigenclass_eval { attr_accessor :testing }
    #   User.testing = true
    def eigenclass_eval(&block)
      eigenclass.instance_eval &block
    end
  end
end

Object.send :include, Huberry::Eigenclass