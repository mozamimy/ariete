# Ariete

Ariete is a module that captures $stdout($stderr) and return as String.  
It is useful on an unit test.

## Requirement

- Ruby 2.0 or later.

## Installation

```shell
$ (sudo) gem install 'ariete'
```

## Usage with test-unit

### klass.rb

```ruby
class Klass
  class << self
    def output
      puts "Ariete is a kind of rabbit."
      warn "Ariete means 'Lop' in Italian."
    end
  end
end
```

### klass_spec.rb

```ruby
require 'test/unit'
require 'ariete'
require_relative 'klass'

class TestKlass < Test::Unit::TestCase
  include Ariete

  def test_output_std
    captured_string = capture_stdout { Klass.output }
    assert_equal "Ariete is a kind of rabbit.\n", captured_string
  end

  def test_output_err
    captured_string = capture_stderr { Klass.output }
    assert_equal "Ariete means 'Lop' in Italian.\n", captured_string
  end
end
```

## with RSpec

Do you want some matchers for RSpec?  
You can use [ariete-rspec](https://github.com/mozamimy/ariete-rspec) gem to extend RSpec.

## Contributing

1. Fork it ( https://github.com/mozamimy/ariete/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
