require 'spec_helper'
require 'robot'
require 'command/invalid'

describe Command::Invalid do
  describe '#execute' do
    let(:table)   { double(:table) }
    let(:robot)   { Robot.new }
    let(:logger)  { double(:logger) }
    let(:command) { Command::Invalid.new }

    it 'does nothing' do
      robot.update_location(x: 0, y: 1, orientation: 'NORTH')
      command.execute(robot, table, logger)

      expect(robot.x).to eq(0)
      expect(robot.y).to eq(1)
      expect(robot.orientation).to eq('NORTH')
    end
  end
end
