require 'spec_helper'
require 'robot'
require 'table'
require 'command/move'

describe Command::Move do
  describe '#execute' do
    let(:table)   { Table.new(5, 3) }
    let(:robot)   { Robot.new }
    let(:logger)  { double(:logger) }
    let(:command) { Command::Move.new }

    context 'robot is placed on the table' do
      context 'robot orientation is NORTH' do
        it 'increases the y coordinator by 1' do
          robot.update_location(x: 4, y: 1, orientation: 'NORTH')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('NORTH')
        end

        it 'does nothing if the y increment leads to an invalid location' do
          robot.update_location(x: 4, y: 2, orientation: 'NORTH')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('NORTH')
        end
      end

      context 'robot orientation is EAST' do
        it 'increases the x coordinator by 1' do
          robot.update_location(x: 3, y: 2, orientation: 'EAST')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('EAST')
        end

        it 'does nothing if the x increment leads to an invalid location' do
          robot.update_location(x: 4, y: 2, orientation: 'EAST')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('EAST')
        end
      end

      context 'robot orientation is SOUTH' do
        it 'decrease the y coordinator by 1' do
          robot.update_location(x: 4, y: 1, orientation: 'SOUTH')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(0)
          expect(robot.orientation).to eq('SOUTH')
        end

        it 'does nothing if the y decrement leads to an invalid location' do
          robot.update_location(x: 4, y: 0, orientation: 'SOUTH')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(4)
          expect(robot.y).to eq(0)
          expect(robot.orientation).to eq('SOUTH')
        end
      end

      context 'robot orientation is WEST' do
        it 'decrease the x coordinator by 1' do
          robot.update_location(x: 1, y: 2, orientation: 'WEST')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(0)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('WEST')
        end

        it 'does nothing if the y decrement leads to an invalid location' do
          robot.update_location(x: 0, y: 2, orientation: 'WEST')

          command.execute(robot, table, logger)

          expect(robot.x).to eq(0)
          expect(robot.y).to eq(2)
          expect(robot.orientation).to eq('WEST')
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
