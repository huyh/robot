require 'spec_helper'
require 'robot'
require 'table'
require 'command/place'

describe Command::Place do
  describe '#initialze' do
    it 'assigns attributes from arguments' do
      command = Command::Place.new('3', '1', 'WEST')

      expect(command.x).to eq(3)
      expect(command.y).to eq(1)
      expect(command.orientation).to eq('WEST')
    end

    it 'assigns -1 to x if cannot parse the first argument to an integer' do
      command = Command::Place.new('a', '1', 'WEST')

      expect(command.x).to eq(-1)
      expect(command.y).to eq(1)
      expect(command.orientation).to eq('WEST')
    end

    it 'assigns -1 to y if cannot parse the second argument to an integer' do
      command = Command::Place.new('3', 'b', 'WEST')

      expect(command.x).to eq(3)
      expect(command.y).to eq(-1)
      expect(command.orientation).to eq('WEST')
    end
  end

  describe '#execute' do
    let(:table)   { Table.new(5, 3) }
    let(:robot)   { Robot.new }
    let(:logger)  { double(:logger) }

    context 'place to a valid location' do
      let(:command) { Command::Place.new('3', '1', 'WEST') }

      it 'updates the robot location' do
        command.execute(robot, table, logger)

        expect(robot.x).to eq(3)
        expect(robot.y).to eq(1)
        expect(robot.orientation).to eq('WEST')
      end
    end

    context 'place to an invalid location' do
      it 'does nothing if the given coordinator is invalid' do
        command = Command::Place.new('5', '1', 'NORTH')
        expect(table).to receive(:valid_location?).with(5, 1).and_return(false)

        command.execute(robot, table, logger)

        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.orientation).to be_nil
      end

      it 'does nothing if the given orientation is invalid' do
        command = Command::Place.new('4', '1', 'SOMETHING')

        command.execute(robot, table, logger)

        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.orientation).to be_nil
      end
    end
  end
end
