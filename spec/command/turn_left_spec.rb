require 'spec_helper'
require 'robot'
require 'command/turn_left'

describe Command::TurnLeft do
  describe '#execute' do
    let(:table)   { double(:table) }
    let(:robot)   { Robot.new }
    let(:logger)  { double(:logger) }
    let(:command) { Command::TurnLeft.new }

    context 'robot is placed on the table' do
      {
        'NORTH' => 'WEST',
        'WEST'  => 'SOUTH',
        'SOUTH' => 'EAST',
        'EAST'  => 'NORTH'
      }.each do |current_orientation, expected_orientation|
        it "rotates the robot orientation from #{current_orientation} to #{expected_orientation}" do
          robot.update_location(x: 0, y: 1, orientation: current_orientation)

          command.execute(robot, table, logger)

          expect(robot.x).to eq(0)
          expect(robot.y).to eq(1)
          expect(robot.orientation).to eq(expected_orientation)
        end
      end
    end

    context 'robot is not placed on the table' do
      it 'does nothing' do
        command.execute(robot, table, logger)

        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.orientation).to be_nil
      end
    end
  end
end
