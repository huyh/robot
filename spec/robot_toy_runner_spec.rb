require 'spec_helper'
require 'robot_toy_runner'

describe RobotToyRunner do
  describe '#run' do
    context 'no input file provided' do
      it 'raises error if there is no input file provided' do
        expect { RobotToyRunner.new(nil).run }.to raise_error('missing input file')
      end
    end

    context 'input file does not exist' do
      it 'raises error if the given input file does not exist' do
        expect(File).to receive(:exist?).with('a file').and_return(false)
        expect {
          RobotToyRunner.new('a file').run
        }.to raise_error('input file a file does not exist')
      end
    end

    context 'input file exists' do
      let(:input_file) { File.expand_path('fixture/seek_first_scenario', File.dirname(__FILE__)) }
      let(:runner) { RobotToyRunner.new(input_file) }

      it 'reads a given input file, parse to commands and execute them' do
        expect_any_instance_of(Command::Place).to receive(:execute)
        expect_any_instance_of(Command::Move).to receive(:execute)
        expect_any_instance_of(Command::Report).to receive(:execute)

        runner.run
      end
    end
  end
end
