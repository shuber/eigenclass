Eigenclass
==========

Utility methods for modifying a ruby object's eigenclass/metaclass


Installation
------------

	gem install shuber-eigenclass --source http://gems.github.com


Usage
-----

This gem allows you to define class level accessors, readers, and writers

	class SomeClass
	  eattr_accessor :test_accessor
	  eattr_reader :test_reader
	  eattr_writer :test_writer
	end
	
	SomeClass.test_accessor = 'testing'


You can also dynamically create class methods

	SomeClass.class_eval do
	  define_class_method 'test_class_method' do
	    'test'
	  end
	end
	
	SomeClass.test_class_method # returns 'test'


You can even evaluate a block of code inside the scope of an object's eigenclass

	SomeClass.eigenclass_eval do
	  attr_accessor :test_eigenclass_eval
	end
	
	SomeClass.test_eigenclass_eval = true


A reference to any object's eigenclass can be accessed by calling

	SomeObject.eigenclass


Contact
-------

Problems, comments, and suggestions all welcome: [shuber@huberry.com](mailto:shuber@huberry.com)