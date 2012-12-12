#!/usr/bin/env ruby
# encoding: utf-8

require "stringio"

# Ariete STDOUT & STDERR Capture Module
# Author::    Moza USANE (mailto:mozamimy@quellencode.org)
# Copyright:: Copyright (c) 2012 Moza USANE
# License::   MIT License (see the LICENSE file)
module Ariete

  ["stdout", "stderr"].each do |name|
    ##
    # :method: capture_stdout
    # Capture STDOUT's output and return as String.
    # ==== Args
    # &block :: a block that you want to capture
    # ==== Return
    # Captured string

    ##
    # :method: capture_stderr
    # Capture STDERR's output and return as String.
    # ==== Args
    # &block :: a block that you want to capture
    # ==== Return
    # Captured string

    ##

    define_method("capture_#{name}") do |*args, &block|
      original = eval("$#{name}")
      eval("$#{name} = StringIO.new")

      begin
        block.call(*args)
      ensure
        ret_str = eval("$#{name}").string
        eval("$#{name} = original")
      end

      ret_str
    end
  end

end
