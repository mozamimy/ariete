require 'test_helper'

class TestAriete < Test::Unit::TestCase
  include Ariete

  def output
    puts "Ariete is a kind of rabbit."
    warn "Ariete means 'Lop' in Italian."
  end

  def test_version
    assert_equal '1.1.0', Ariete::VERSION
  end

  def test_capture_stdout
    captured_string = capture_stdout { output }
    assert_equal "Ariete is a kind of rabbit.\n", captured_string
  end

  def test_capture_stderr
    captured_string = capture_stderr { output }
    assert_equal "Ariete means 'Lop' in Italian.\n", captured_string
  end

  def test_capture_stdout_as_module_function
    captured_string = Ariete.capture_stdout { output }
    assert_equal "Ariete is a kind of rabbit.\n", captured_string
  end

  def test_capture_stderr_as_module_function
    captured_string = Ariete.capture_stderr { output }
    assert_equal "Ariete means 'Lop' in Italian.\n", captured_string
  end
end
