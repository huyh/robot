require 'spec_helper'
require 'table'

describe Table do
  let(:width)   { 6 }
  let(:height)  { 4 }
  let(:table)   { Table.new(width, height) }

  describe '#inside?' do
    it 'is true if x and y are 0' do
      expect(table.inside?(0, 0)).to be_truthy
    end

    it 'is false if x is less than 0' do
      expect(table.inside?(-1, 0)).to be_falsy
    end

    it 'is false if y is less than 0' do
      expect(table.inside?(0, -1)).to be_falsy
    end

    it 'is false if x is equals to the table width' do
      expect(table.inside?(width, 0)).to be_falsy
    end

    it 'is false if y is equals to the table height' do
      expect(table.inside?(0, height)).to be_falsy
    end

    it 'is false if x is greater than the table width' do
      expect(table.inside?(width + 1, 0)).to be_falsy
    end

    it 'is false if y is greater than the table height' do
      expect(table.inside?(0, height + 1)).to be_falsy
    end

    it 'is true if x is less than the table width' do
      expect(table.inside?(width - 1, 0)).to be_truthy
    end

    it 'is true if y is less than the table height' do
      expect(table.inside?(0, height - 1)).to be_truthy
    end
  end
end
