require 'orientation'

module Command
  class TurnRight
    def execute(robot, _table)
      return unless robot.placed?
      new_orientation = Orientation.right_of(robot.orientation)
      robot.orientation = new_orientation
    end
  end
end
