class CommandData
  attr_reader :type, :arguments

  def initialize(type, *arguments)
    @type = type
    @arguments = arguments
  end
end
