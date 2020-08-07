module GameHelper
  def game_commands_options
    { 'Place': '1', 'Move': '2', 'Left': '3', 'Right': '4' }
  end

  def robot_place?(game, line, column)
    same_line = game.position_line == line
    same_column = game.position_column == column
    same_line && same_column
  end
end
