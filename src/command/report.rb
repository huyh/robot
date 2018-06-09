module Command
  class Report
    def execute(robot, _table)
      return unless robot.placed?
      puts "#{robot.x},#{robot.y},#{robot.orientation}"
    end
  end
end
