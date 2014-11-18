# Ariete
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "spec_helper"

RSpec.describe Ariete do
  include Ariete

  def output
    puts "Ariete is a kind of rabbit."
    warn "Ariete means 'Lop' in Italian."
  end

  describe "#capture_stdout" do
    subject { capture_stdout { output } }
    it { expect(subject).to eq "Ariete is a kind of rabbit.\n" }
  end

  describe "#capture_stderr" do
    subject { capture_stderr { output } }
    it { expect(subject).to eq "Ariete means 'Lop' in Italian.\n" }
  end

  describe "module_function" do
    describe "#capture_stdout" do
      subject { Ariete.capture_stdout { output } }
      it { expect(subject).to eq "Ariete is a kind of rabbit.\n" }
    end

    describe "#capture_stderr" do
      subject { Ariete.capture_stderr { output } }
      it { expect(subject).to eq "Ariete means 'Lop' in Italian.\n" }
    end
  end

  describe "custom matchers" do
    describe "#be_output" do
      subject { method(:output).to_proc }
      it { expect(subject).to be_output "Ariete is a kind of rabbit.\n" }
    end

    describe "#be_output_to_stderr" do
      subject { method(:output).to_proc }
      it { expect(subject).to be_output_to_stderr "Ariete means 'Lop' in Italian.\n" }
    end
  end
end
