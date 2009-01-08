require 'test/unit'
require File.dirname(__FILE__) + '/../lib/eigenclass'

class TestClass; end
class ChildTestClass < TestClass; end
class AnotherTestClass; end

class EigenclassTest < Test::Unit::TestCase
  
  def test_should_return_the_eigenclass
    assert_equal (class << TestClass; self; end), TestClass.eigenclass
  end
  
  def test_should_return_the_same_instance_of_the_eigenclass
    assert_equal TestClass.eigenclass.object_id, TestClass.eigenclass.object_id
  end
  
  def test_should_eigenclass_eval_correctly
    assert !TestClass.respond_to?(:testing)
    TestClass.eigenclass_eval do
      define_method 'testing' do
        'test'
      end
    end
    assert TestClass.respond_to?(:testing)
    assert_equal 'test', TestClass.testing
  end
  
  def test_should_define_class_method
    assert !TestClass.respond_to?(:testing_again)
    TestClass.class_eval do
      define_class_method 'testing_again' do
        'test'
      end
    end
    assert TestClass.respond_to?(:testing_again)
    assert_equal 'test', TestClass.testing_again
  end
  
  def test_child_class_should_inherit_defined_class_methods
    assert !ChildTestClass.respond_to?(:testing_yet_again)
    TestClass.class_eval do
      define_class_method 'testing_yet_again' do
        'test'
      end
    end
    assert ChildTestClass.respond_to?(:testing_yet_again)
    assert_equal 'test', ChildTestClass.testing_yet_again
  end
  
  def test_should_not_define_methods_accross_all_classes
    assert !TestClass.respond_to?(:testing_one_more_time)
    assert !AnotherTestClass.respond_to?(:testing_one_more_time)
    TestClass.class_eval do
      define_class_method 'testing_one_more_time' do
        'test'
      end
    end
    assert TestClass.respond_to?(:testing_one_more_time)
    assert !AnotherTestClass.respond_to?(:testing_one_more_time)
  end
  
  def test_cattr_accessor
    assert !TestClass.respond_to?(:this_is_a_test)
    TestClass.eattr_accessor :this_is_a_test
    assert TestClass.respond_to?(:this_is_a_test)
    assert TestClass.this_is_a_test.nil?
    TestClass.this_is_a_test = true
    assert TestClass.this_is_a_test
  end
  
  def test_cattr_reader
    assert !TestClass.respond_to?(:this_is_another_test)
    TestClass.eattr_reader :this_is_another_test
    assert TestClass.respond_to?(:this_is_another_test)
    assert TestClass.this_is_another_test.nil?
    TestClass.instance_variable_set('@this_is_another_test', true)
    assert TestClass.this_is_another_test
  end
  
  def test_cattr_writer
    assert !TestClass.respond_to?(:this_is_yet_another_test=)
    TestClass.eattr_writer :this_is_yet_another_test
    assert TestClass.respond_to?(:this_is_yet_another_test=)
    assert TestClass.instance_variable_get('@this_is_yet_another_test').nil?
    TestClass.this_is_yet_another_test = true
    assert TestClass.instance_variable_get('@this_is_yet_another_test')
  end
  
end