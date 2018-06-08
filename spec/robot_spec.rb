require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot) { Robot.new }

  describe '#update_location' do
    it 'updates to location to the given coordination and orientation' do
      robot.update_location(x: 1, y: 2, orientation: 'NORTH')

      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.orientation).to eq('NORTH')
    end
  end

  describe '#placed?' do
    it 'is false if x is nil' do
      robot.update_location(y: 0, orientation: 'EAST')
      expect(robot.placed?).to be_falsy
    end

    it 'is false if y is nil' do
      robot.update_location(x: 0, orientation: 'SOUTH')
      expect(robot.placed?).to be_falsy
    end

    it 'is false if orientation is nil' do
      robot.update_location(x: 0, y: 0)
      expect(robot.placed?).to be_falsy
    end

    it 'is true if x, y and orientation are not nil' do
      robot.update_location(x: 0, y: 0, orientation: 'WEST')
      expect(robot.placed?).to be_truthy
    end
  end
end
