require 'open3'
require 'spec_helper'

describe 'script to run Robot toy' do
  it 'runs robot toy' do
    file = File.expand_path('../fixture/some_invalid_commands', File.dirname(__FILE__))

    execute_and_verify(input_file: file, expected_output: "3,4,WEST\n3,3,NORTH\n")
  end

  it 'runs the first given scenario correctly' do
    file = File.expand_path('../fixture/seek_first_scenario', File.dirname(__FILE__))

    execute_and_verify(input_file: file, expected_output: "0,1,NORTH\n")
  end

  it 'runs the second given scenario correctly' do
    file = File.expand_path('../fixture/seek_second_scenario', File.dirname(__FILE__))

    execute_and_verify(input_file: file, expected_output: "0,0,WEST\n")
  end

  it 'runs the third given scenario correctly' do
    file = File.expand_path('../fixture/seek_third_scenario', File.dirname(__FILE__))

    execute_and_verify(input_file: file, expected_output: "3,3,NORTH\n")
  end

  def execute_and_verify(input_file:, expected_output:)
    stdout, stderr, status = Open3.capture3('./bin/run_robot_toy', input_file)

    expect(status.exitstatus).to eq(0)
    expect(stdout).to eq(expected_output)
    expect(stderr).to be_empty
  end
end
