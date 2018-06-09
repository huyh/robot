require 'orientation'

module Command
  class TurnLeft
    def execute(robot, _table)
      return unless robot.placed?
      new_orientation = Orientation.left_of(robot.orientation)
      robot.orientation = new_orientation
    end
  end
end
