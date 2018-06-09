require 'spec_helper'
require 'file_input_reader'

describe FileInputReader do
  let(:input_file) { File.expand_path('fixture/seek_first_scenario', File.dirname(__FILE__)) }
  let(:reader) { FileInputReader.new }

  it 'performs a given action on each input line' do
    obj = double
    expect(obj).to receive(:do_something).exactly(3).times

    reader.each_line(input_file) do |line|
      obj.do_something(line)
    end
  end
end
