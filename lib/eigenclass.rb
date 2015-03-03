require 'delegate'
require 'eigenclass/version'

module Eigenclass
  extend Forwardable

  def_delegator :eigenclass, :attr_accessor, :eattr_accessor
  def_delegator :eigenclass, :attr_reader, :eattr_reader
  def_delegator :eigenclass, :attr_writer, :eattr_writer
  def_delegator :eigenclass, :define_method, :edefine_method
  def_delegator :eigenclass, :instance_eval, :eigenclass_eval
  def_delegator :eigenclass, :instance_exec, :eigenclass_exec

  def eigenclass
    class << self
      self
    end
  end
end

Object.send(:include, Eigenclass)
