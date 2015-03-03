require 'delegate'

module Eigenclass
  extend Forwardable

  # Returns an object's eigenclass
  def eigenclass
    class << self
      self
    end
  end

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
  def_delegator :eigenclass, :attr_accessor, :eattr_accessor
  
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
  #   User.testing #=> true
  def_delegator :eigenclass, :attr_reader, :eattr_reader
  
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
  def_delegator :eigenclass, :attr_writer, :eattr_writer
  
  # Uses <tt>eigenclass_eval</tt> to define a method in an object's <tt>eigenclass</tt>
  # which can be called like a class method
  #
  # Example
  #
  #   User.class_eval do
  #     define_class_method('testing') do
  #       'test'
  #     end
  #   end
  #
  #   User.testing #=> 'test'
  def_delegator :eigenclass, :define_method, :define_class_method
  
  # Accepts a block to evaluate inside the scope of an object's <tt>eigenclass</tt>
  #
  # Example
  #
  #   User.eigenclass_eval { attr_accessor :testing }
  #   User.testing = true
  def_delegator :eigenclass, :instance_eval, :eigenclass_eval
end

Object.send(:include, Eigenclass)
