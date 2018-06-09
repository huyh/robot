require 'orientation'
require 'command/base'

module Command
  class TurnRight < Base
    def execute(robot, _table, _logger)
      return unless robot.placed?
      new_orientation = Orientation.right_of(robot.orientation)
      robot.orientation = new_orientation
    end
  end
end
