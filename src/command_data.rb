class CommandData
  attr_reader :action, :arguments

  def initialize(action, *arguments)
    @action = action
    @arguments = arguments
  end
end
