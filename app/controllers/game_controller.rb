class GameController < ApplicationController
  before_action :set_game
  before_action :set_current_game, only: :update
  rescue_from StandardError, with: :error_game

  def index
  end

  def update
    service = GameCommandService.new(@game, place_params)
    service.execute

    render 'index'
  end

  private

  def set_game
    @game = RobotToyJonhnes::Game.new
  end

  def set_current_game
    @game.position_line = params[:current_line].to_i
    @game.position_column = params[:current_column].to_i
    @game.facing = params[:current_orientation].to_sym
  end

  def place_params
    params.permit(:command, :place)
  end

  def error_game(error)
    @error = error.message
    render 'index'
  end
end
