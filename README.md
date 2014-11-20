# Ariete

Ariete is a module that captures $stdout($stderr) and return as String.  
It is useful on an unit test.

## Requirement

- Ruby 2.0 or later.

## Installation

```shell
$ (sudo) gem install 'ariete'
```

## Usage

### rspec

#### klass.rb

```ruby
class Klass
  class << self
    def output_out
      puts "Ariete is a kind of rabbit."
    end

    def output_err
      warn "Ariete means 'Lop' in Italian."
    end
  end
end
```

#### klass_spec.rb

```ruby
require "ariete"
require_relative "klass"

RSpec.describe Klass do
  include Ariete

  # Ariete extends matchers of RSpec.
  # Therefore, you can use 'be_output' and 'be_output_to_stderr'.
  describe ".output_out" do
    subject { Klass.method(:output_out).to_proc }
    it { expect(subject).to be_output "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_out (an alternate expression)" do
    subject { -> { Klass.output_out } }
    it { expect(subject).to be_output "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_err" do
    subject { Klass.method(:output_err).to_proc }
    it { expect(subject).to be_output_to_stderr "Ariete means 'Lop' in Italian.\n" }
  end

  # You can use without 'Ariete.' if you include Ariete.
  describe ".output_out" do
    subject { capture_stdout { Klass.output_out } }
    it { expect(subject).to eq "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_err" do
    subject { capture_stderr { Klass.output_err } }
    it { expect(subject).to eq "Ariete means 'Lop' in Italian.\n" }
  end

  # Also you can use as 'Ariete.capture_xxx'
  describe ".output_out" do
    subject { Ariete.capture_stdout { Klass.output_out } }
    it { expect(subject).to eq "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_err" do
    subject { Ariete.capture_stderr { Klass.output_err } }
    it { expect(subject).to eq "Ariete means 'Lop' in Italian.\n" }
  end
end
```

## Contributing

1. Fork it ( https://github.com/mozamimy/ariete/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
