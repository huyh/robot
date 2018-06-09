require 'orientation'

module Command
  class Place
    attr_reader :x, :y, :orientation

    def initialize(*arguments)
      @x = Integer(arguments[0]) rescue -1
      @y = Integer(arguments[1]) rescue -1
      @orientation = arguments[2]
    end

    def execute(robot, table)
      return unless valid_location?(table)
      robot.update_location(x: x, y: y, orientation: orientation)
    end

    private

      def valid_location?(table)
        table.valid_location?(x, y) && Orientation.valid?(orientation)
      end
  end
end
