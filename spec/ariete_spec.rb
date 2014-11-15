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
end
