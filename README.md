# eigenclass - [![Build Status](https://secure.travis-ci.org/shuber/eigenclass.png)](http://travis-ci.org/shuber/eigenclass) [![Code Climate](https://codeclimate.com/github/shuber/eigenclass/badges/gpa.svg)](https://codeclimate.com/github/shuber/eigenclass) [![Coverage](https://codeclimate.com/github/shuber/eigenclass/badges/coverage.svg)](https://codeclimate.com/github/shuber/eigenclass)

Eigenclasses (aka metaclasses or singleton classes) in Ruby.

Check out the [metaclass] implementations in other languages for more examples.

**Note**: This gem was originally written back in 2008. Since then, Ruby has introduced a couple new methods which provide the same functionality as this gem's `eigenclass` and `edefine_method` methods.

* [Object#singleton_class]
* [Object#define_singleton_method]

[metaclasses]: http://en.wikipedia.org/wiki/Metaclass
[Object#singleton_class]: http://ruby-doc.org/core-1.9.2/Object.html#method-i-singleton_class
[Object#define_singleton_method]: http://ruby-doc.org/core-1.9.2/Object.html#method-i-define_singleton_method


## Installation

```
gem install eigenclass
```


## Usage

Everything in Ruby is an object, including classes.

```ruby
class SomeObject
end
```

Every object has an `eigenclass`.

```ruby
SomeObject.eigenclass #=> #<Class:#<SomeObject:0x007f9611030300>>
```

The implementation of the `eigenclass` method is pretty simple.

```ruby
class Object
  def eigenclass
    class << self
      self
    end
  end
end
```

Evaluating code within the context of an object's `eigenclass` allows us to do some pretty cool things - like defining class level attributes.

```ruby
SomeObject.eigenclass_eval do
  attr_accessor :testing
end

SomeObject.testing = :example
SomeObject.testing #=> :example
```

The convenience methods for defining class level methods makes this even easier.

```ruby
class SomeObject
  eattr_accessor :test_accessor
  eattr_reader :test_reader
  eattr_writer :test_writer

  edefine_method(:test_class_method) do
    :test_define
  end
end

SomeObject.test_class_method #=> :test_define
```

Since all objects have an `eigenclass`, we can even define methods for a single _instance_ of a class.

```ruby
object = SomeObject.new
object.eattr_accessor :example
object.example = "cool"
object.example #=> cool

other_object = SomeObject.new
other_object.example #=> NoMethodError undefined method `example' for #<SomeObject:0x007fee348dde00>
```

This is pretty incredible! We can hook in and inject behavior into any and all objects - **at runtime**!

Ruby is like one big plugin framework - with an awesome standard library and amazing community!


## API

* [eattr_accessor](http://ruby-doc.org/core-1.9.3/Module.html#method-i-attr_accessor)
* [eattr_reader](http://ruby-doc.org/core-1.9.3/Module.html#method-i-attr_reader)
* [eattr_writer](http://ruby-doc.org/core-1.9.3/Module.html#method-i-attr_writer)
* [edefine_method](http://ruby-doc.org/core-1.9.3/Module.html#method-i-define_method)
* [eigenclass_eval](http://ruby-doc.org/core-1.9.3/BasicObject.html#method-i-instance_eval)
* [eigenclass_exec](http://ruby-doc.org/core-1.9.3/BasicObject.html#method-i-instance_exec)


## Testing

```
bundle exec rspec
```


## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with Rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


## License

[MIT](https://github.com/shuber/eigenclass/blob/master/LICENSE)  - Copyright © 2008 Sean Huber
