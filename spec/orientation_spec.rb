require 'spec_helper'

describe Orientation do
  describe '#valid?' do
    it 'is true for valid orientation' do
      %w(NORTH EAST SOUTH WEST).each do |orientation|
        expect(Orientation.valid?(orientation)).to be_truthy
      end
    end

    it 'is false for invalid orientation' do
      expect(Orientation.valid?('INVALID')).to be_falsy
    end
  end

  describe '#left_of' do
    it 'returns the orientation on the left hand side of the given' do
      expect(Orientation.left_of('NORTH')).to eq('WEST')
      expect(Orientation.left_of('EAST')).to eq('NORTH')
      expect(Orientation.left_of('SOUTH')).to eq('EAST')
      expect(Orientation.left_of('WEST')).to eq('SOUTH')
    end

    it 'returns nil if the given orientation is invalid' do
      expect(Orientation.left_of('INVALID')).to be_nil
    end
  end

  describe '#right_of' do
    it 'returns the orientation on the right hand side of the given' do
      expect(Orientation.right_of('NORTH')).to eq('EAST')
      expect(Orientation.right_of('EAST')).to eq('SOUTH')
      expect(Orientation.right_of('SOUTH')).to eq('WEST')
      expect(Orientation.right_of('WEST')).to eq('NORTH')
    end

    it 'returns nil if the given orientation is invalid' do
      expect(Orientation.right_of('INVALID')).to be_nil
    end
  end
end
