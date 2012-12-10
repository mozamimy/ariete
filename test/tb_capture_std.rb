#!/usr/bin/env ruby
# encoding: utf-8

require "test/unit"
require_relative "../lib/ariete"

class CaptureStdTest < Test::Unit::TestCase
  include Ariete

  def test_stdout
    result = capture_stdout {output("Ariete")}
    assert_equal("Ariete is a kind of rabbit.\n", result)
  end

  def test_stderr
    result = capture_stderr {output("Ariete")}
    assert_equal("Ariete means 'Lop' in Italian\n", result)
  end

  def output(str)
    puts "#{str} is a kind of rabbit."
    warn "#{str} means 'Lop' in Italian"
  end
end
