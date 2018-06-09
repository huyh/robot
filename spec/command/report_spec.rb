require 'spec_helper'
require 'robot'
require 'command/report'

describe Command::Report do
  describe '#execute' do
    let(:table)   { double(:table) }
    let(:robot)   { Robot.new }
    let(:logger)  { double(:logger) }
    let(:command) { Command::Report.new }

    context 'robot is placed on the table' do
      it 'prints out the current location of the robot' do
        robot.update_location(x: 3, y: 1, orientation: 'NORTH')

        expect(logger).to receive(:log).with('3,1,NORTH')

        command.execute(robot, table, logger)
      end
    end

    context 'robot is not placed on the table' do
      it 'does nothing' do
        expect(logger).to_not receive(:log)

        command.execute(robot, table, logger)
      end
    end
  end
end
