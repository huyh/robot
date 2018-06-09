require 'command_data'

class InputParser
  def parse(line)
    type, arguments_string = line.strip.split(/\s+/, 2)
    arguments = arguments_string.to_s.strip.split(',').map(&:strip)

    CommandData.new(type.to_s, *arguments)
  end
end
