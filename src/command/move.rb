require 'orientation'

module Command
  class Move
    def execute(robot, table)
      return unless robot.placed?

      case robot.orientation
        when Orientation::NORTH then move_toward_north(robot, table)
        when Orientation::EAST  then move_toward_east(robot, table)
        when Orientation::SOUTH then move_toward_south(robot, table)
        when Orientation::WEST  then move_toward_west(robot, table)
      end
    end

    private

      def move_toward_north(robot, table)
        new_y = robot.y + 1
        move(robot, table, robot.x, new_y)
      end

      def move_toward_east(robot, table)
        new_x = robot.x + 1
        move(robot, table, new_x, robot.y)
      end

      def move_toward_south(robot, table)
        new_y = robot.y - 1
        move(robot, table, robot.x, new_y)
      end

      def move_toward_west(robot, table)
        new_x = robot.x - 1
        move(robot, table, new_x, robot.y)
      end

      def move(robot, table, new_x, new_y)
        return unless table.valid_location?(new_x, new_y)
        robot.x = new_x
        robot.y = new_y
      end
  end
end
