require 'forwardable'
require 'eigenclass/version'

# Provides access to an object's {eigenclass} and defines
# some convenient helper methods to interact with it.
module Eigenclass
  extend Forwardable

  def_delegator :eigenclass, :alias_method, :ealias_method
  def_delegator :eigenclass, :attr_accessor, :eattr_accessor
  def_delegator :eigenclass, :attr_reader, :eattr_reader
  def_delegator :eigenclass, :attr_writer, :eattr_writer
  def_delegator :eigenclass, :define_method, :edefine_method
  def_delegator :eigenclass, :included_modules, :extended_modules
  def_delegator :eigenclass, :instance_eval, :eigenclass_eval
  def_delegator :eigenclass, :instance_exec, :eigenclass_exec

  # Alias of {Object#singleton_class}
  # @see http://ruby-doc.org/core-1.9.2/Object.html#method-i-singleton_class
  def eigenclass
    class << self
      self
    end
  end
end

Object.send(:include, Eigenclass)
