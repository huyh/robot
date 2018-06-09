require 'spec_helper'
require 'robot'
require 'table'
require 'command/report'

describe Command::Report do
  describe '#execute' do
    let(:table)   { Table.new(5, 3) }
    let(:robot)   { Robot.new }
    let(:command) { Command::Report.new }

    context 'robot is placed on the table' do
      it 'prints out the current location of the robot' do
        robot.update_location(x: 3, y: 1, orientation: 'NORTH')

        expect($stdout).to receive(:puts).with('3,1,NORTH')

        command.execute(robot, table)
      end
    end

    context 'robot is not placed on the table' do
      it 'does nothing' do
        expect($stdout).to_not receive(:puts)

        command.execute(robot, table)
      end
    end
  end
end
