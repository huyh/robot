require 'command/base'

module Command
  class Report < Base
    def execute(robot, _table, logger)
      return unless robot.placed?
      logger.log("#{robot.x},#{robot.y},#{robot.orientation}")
    end
  end
end
