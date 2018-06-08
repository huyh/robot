require 'spec_helper'
require 'command_factory'
require 'command_data'
require 'command/place'
require 'command/move'
require 'command/turn_left'
require 'command/turn_right'
require 'command/report'

describe CommandFactory do
  let(:factory) { CommandFactory.new }

  describe '#create_command' do
    context 'valid commands' do
      {
        CommandData.new('PLACE', 0, 0, 'NORTH') => Command::Place,
        CommandData.new('MOVE') => Command::Move,
        CommandData.new('LEFT') => Command::TurnLeft,
        CommandData.new('RIGHT') => Command::TurnRight,
        CommandData.new('REPORT') => Command::Report
      }.each do |command_data, expected_command_class|
        it "creates a #{command_data.action} command object" do
          expect(factory.create(command_data)).to be_instance_of(expected_command_class)
        end
      end
    end

    context 'invalid command' do
      let(:invalid_command_data) { CommandData.new('INVALID') }

      it 'creates an invalid command object' do
        expect(factory.create(invalid_command_data)).to be_instance_of(Command::Invalid)
      end
    end
  end
end
