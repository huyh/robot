require 'spec_helper'
require 'input_parser'

describe InputParser do
  describe '#parse' do
    let(:parser) { InputParser.new }

    it 'returns a CommandData object built from an input line' do
      command_data = parser.parse(' PLACE 1 , 2 , WEST ')

      expect(command_data.type).to eq('PLACE')
      expect(command_data.arguments).to eq(['1', '2', 'WEST'])
    end

    it 'can parse an input line with no arguments' do
      command_data = parser.parse(' MOVE ')

      expect(command_data.type).to eq('MOVE')
      expect(command_data.arguments).to be_empty
    end
  end
end
