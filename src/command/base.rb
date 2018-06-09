module Command
  class Base
    def initialize(*arguments)
    end

    protected

    def execute(robot, table, logger)
      raise 'subclass must implement execute method'
    end
  end
end
