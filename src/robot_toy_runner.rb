require 'command_factory'
require 'file_input_reader'
require 'input_parser'
require 'robot'
require 'standard_output_logger'
require 'table'

class RobotToyRunner
  attr_reader :robot, :table, :input_file, :input_reader, :input_parser, :command_factory, :logger

  def initialize(input_file = nil)
    @input_file = input_file
    @robot = Robot.new
    @table = Table.new(5, 5)
    @input_parser = InputParser.new
    @command_factory = CommandFactory.new
    @input_reader = FileInputReader.new
    @logger = StandardOutputLogger.new
  end

  def run
    check_input_file

    @input_reader.each_line(input_file) do |line|
      command_data = input_parser.parse(line)
      command = command_factory.create(command_data)
      command.execute(robot, table, logger)
    end
  end

  private

    def check_input_file
      raise 'missing input file' unless input_file
      raise "input file #{input_file} does not exist" unless File.exist?(input_file)
    end
end
