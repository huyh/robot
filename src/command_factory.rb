require 'command/place'
require 'command/move'
require 'command/turn_left'
require 'command/turn_right'
require 'command/report'
require 'command/invalid'

class CommandFactory
  VALID_ACTIONS = {
    'PLACE' => Command::Place,
    'MOVE' => Command::Move,
    'LEFT' => Command::TurnLeft,
    'RIGHT' => Command::TurnRight,
    'REPORT' => Command::Report
  }

  def create(command_data)
    VALID_ACTIONS.fetch(command_data.action, Command::Invalid).new(*command_data.arguments)
  end
end
