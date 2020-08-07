class GameCommandService
  attr :game, :command, :place
  COMMAND_OPTIONS = { '1' => :place_command, '2' => :move_command,
                      '3' => :rotate_left_command, '4' => :rotate_right_command }

  def initialize(game, params)
    @game = game
    @command = params[:command]
    @place = params[:place]
  end

  def execute
    send COMMAND_OPTIONS[command]
  end

  private

  def place_command
    game.place place
  end

  def move_command
    game.move
  end

  def rotate_left_command
    game.rotate_left
  end

  def rotate_right_command
    game.rotate_right
  end
end