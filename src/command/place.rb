require 'orientation'
require 'command/base'

module Command
  class Place < Base
    attr_reader :x, :y, :orientation

    def initialize(*arguments)
      super(*arguments)

      @x = convert_to_int(arguments[0])
      @y = convert_to_int(arguments[1])
      @orientation = arguments[2]
    end

    def execute(robot, table, _logger)
      return unless valid_location?(table)
      robot.update_location(x: x, y: y, orientation: orientation)
    end

    private

      def convert_to_int(arg)
        arg =~ /^\d+$/ ? arg.to_i : -1
      end

      def valid_location?(table)
        table.valid_location?(x, y) && Orientation.valid?(orientation)
      end
  end
end
